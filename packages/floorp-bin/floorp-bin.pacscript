pkgname="floorp-bin"
gives="floorp"
pkgver="11.10.5"
repology=("project: ${gives}")
sha256sums_amd64=("64d264d503a669188e2b38db07490a8a7d82a114c0f18c6b18d4253e6e8af710")
sha256sums_arm64=("695dc6185df33b5ee22b802f3ba1d0043c1ebe366cce2a897431dcd8e77fa922")
if [[ ${CARCH} == amd64 ]]; then
  gnuarch="x86_"
else
  gnuarch="aarch"
  fancy_message warn "Floorp is not running properly on ${BBlue}arm64${NC}. It should only be installed for development."
  if [[ ! -f "${METADIR}/${pkgname}-override" && ${PWD} == "/tmp/pacstall" ]]; then
    if ask "[${BYellow}*${NC}] ${BOLD}WARNING${NC}: Cancel installation?" Y; then
      exit
    fi
  fi
fi
source=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/${gives}-${pkgver}.linux-${gnuarch}64.tar.bz2")
homepage='https://floorp.app/'
pkgdesc="Firefox-based Browser build for keeping the Open, Private and Sustainable Web alive"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=('amd64' 'arm64')

package() {
  cd "${_archive}"
  if [[ ${CARCH} == "arm64" ]]; then
    mkdir -p "${pkgdir}/${METADIR}"
    touch "${pkgdir}/${METADIR}/${pkgname}-override"
  fi
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/lib/floorp"
  cp -r floorp/* "${pkgdir}/usr/lib/floorp"
  chmod +x "${pkgdir}/usr/lib/floorp/floorp"
  chmod +x "${pkgdir}/usr/lib/floorp/floorp-bin"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Floorp
Comment=Web Browser
Exec=/usr/lib/floorp/floorp --class="floorp" %u
X-MultipleArgs=false
Terminal=false
Type=Application
Icon=/usr/lib/floorp/browser/chrome/icons/default/default128.png
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
Actions=new-window;new-private-window;profile-manager-window;

[Desktop Action new-window]
Name=Open a New Window
Exec=/usr/lib/floorp/floorp --class="floorp" --new-window

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=/usr/lib/floorp/floorp --class="floorp" --private-window

[Desktop Action profile-manager-window]
Name=Open the Profile Manager
Exec=/usr/lib/floorp/floorp --class="floorp" --ProfileManager' | tee "${pkgdir}/usr/share/applications/floorp.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/lib/floorp/floorp-bin" "${pkgdir}/usr/bin/floorp-bin"
  ln -sf "/lib/floorp/floorp" "${pkgdir}/usr/bin/floorp"
}
