pkgname="youplaytx"
pkgver="0.4.4"
pkgrel="1"
pkgdesc="Full-screen, dual-pane YouTube audio player for the terminal"
arch=("any")
url="https://codeberg.org/ProfP303/youplaytx"
license=("GPL-3.0-or-later")
maintainer=("ProfP303 <prof.p@gmx.net>")

# Apt only provides system-level deps; Python deps (textual, python-mpv,
# yt-dlp, pyperclip, platformdirs, tomli-w) come from PyPI into a venv,
# because Ubuntu's python3-textual is far too old for this app.
depends=("python3" "python3-venv" "mpv")

# REQUIRED: pacstall builds inside a bubblewrap sandbox without network
# access unless this is set. pip needs it to reach PyPI.
external_connection=true

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("21b66bd0c4c59620a4a9a7aa8ae6bd89dc7461657eb12e2d7ae415d7a6574b40")

package() {
  # Do not rely on auto-cd: enter the extracted source explicitly.
  # Forgejo/Codeberg tag tarballs extract to "<reponame>/" (no version).
  cd "${srcdir}/${pkgname}"

  local appdir="/opt/${pkgname}"
  local stagedir="${pkgdir}${appdir}"

  # 1) Self-contained venv inside the staged package.
  python3 -m venv "${stagedir}"

  # 2) Install the app + its PyPI deps. Calling pip as `python -m pip`
  #    (instead of the `pip` script) avoids the kernel's shebang length
  #    limit, which the long ${pkgdir} staging path can exceed.
  #    --no-compile: bytecode is generated in step 4 with clean paths.
  "${stagedir}/bin/python" -m pip install --no-cache-dir --no-compile .

  # 3) Strip the staging prefix from every *text* file that embeds it:
  #    console-script shebangs, activate scripts, pyvenv.cfg (its
  #    "command =" line records ${pkgdir} on Python 3.11+), and pip's
  #    RECORD/direct_url.json metadata. --binary-files=without-match
  #    guarantees sed never touches a binary file.
  grep -rlZ --binary-files=without-match "${pkgdir}" "${stagedir}" \
    | xargs -0r sed -i "s|${pkgdir}||g"

  # 4) Pre-compile bytecode with the staging prefix stripped (-s), so
  #    .pyc files and tracebacks reference /opt/... — and Python never
  #    needs to write into the root-owned /opt at runtime.
  "${stagedir}/bin/python" -m compileall -q -s "${pkgdir}" "${stagedir}/lib"

  # 5) Launcher on PATH. The symlink target must be the FINAL path,
  #    never ${pkgdir} — pkgdir is a temporary staging root that is
  #    deleted after the .deb is built.
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "${appdir}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # 6) License.
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/doc/${pkgname}"
}
