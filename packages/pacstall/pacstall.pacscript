pkgname="pacstall"
pkgver="6.3.7"
arch=("all")
pkgdesc="An AUR-inspired package manager for Ubuntu
Pacstall is the AUR Ubuntu wishes it had. It takes the concept of the AUR
and puts a spin on it, making it easier to install and update downstream programs,
without scouring github repos and the likes."
url='https://pacstall.dev'
depends=(
  'bash'
  'curl'
  'wget'
  'git'
  'unzip'
  'zstd'
  'tar'
  'gzip'
  'sensible-utils'
  'iputils-ping'
  'ca-certificates'
  'aptitude'
  'bubblewrap'
  'build-essential'
  'jq'
  'distro-info-data'
  'gettext'
)
makedepends=(
  'gettext'
  'gzip'
)
recommends=(
  'axel'
  'ninja-build'
  'meson'
  'spdx-licenses'
)
maintainer=(
  "Pacstall Team <pacstall@pm.me>"
  "Elsie19 <hwengerstickel@pm.me>"
)
backup=('usr/share/pacstall/repo/pacstallrepo' 'usr/share/pacstall/update')
source=("https://github.com/pacstall/pacstall/archive/refs/tags/${pkgver}.zip")

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/pacstall/scripts/"
  mkdir -p "${pkgdir}/usr/share/pacstall/repo/"
  mkdir -p "${pkgdir}/usr/share/man/man8/"
  mkdir -p "${pkgdir}/usr/share/man/man5/"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
  mkdir -p "${pkgdir}/var/log/pacstall/error_log/"
  mkdir -p "${pkgdir}/var/lib/pacstall/metadata/"
  mkdir -p "${pkgdir}/var/cache/pacstall/"
  mkdir -p "${pkgdir}/usr/src/pacstall/"
  mapfile -t linguas < "misc/po/LINGUAS"
  for lang in "${linguas[@]}"; do
    mkdir -p "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/"
  done
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 pacstall "${pkgdir}/usr/bin/"
  install -Dm755 "misc/scripts"/* "${pkgdir}/usr/share/pacstall/scripts/"
  gzip -9n misc/man/pacstall.8
  gzip -9n misc/man/pacstall.5
  install "misc/man/pacstall.8.gz" "${pkgdir}/usr/share/man/man8/"
  install "misc/man/pacstall.5.gz" "${pkgdir}/usr/share/man/man5/"
  install "misc/completion/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/pacstall.fish"
  install "misc/completion/bash" "${pkgdir}/usr/share/bash-completion/completions/pacstall"
  echo "https://raw.githubusercontent.com/pacstall/pacstall-programs/master" | tee "${pkgdir}/usr/share/pacstall/repo/pacstallrepo" > /dev/null
  mapfile -t linguas < "misc/po/LINGUAS"
  for lang in "${linguas[@]}"; do
    msgfmt -o "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/pacstall.mo" "misc/po/${lang}.po"
  done
  rm -f "${pkgdir}/usr/share/pacstall/scripts/update.sh"
}

pre_install() {
  rm -f "/usr/share/pacstall/scripts/update.sh"
}
