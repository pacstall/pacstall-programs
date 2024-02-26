name="floorp-bin"
gives="floorp"
pkgver="11.8.2"
repology=("project: ${gives}")
if [[ ${CARCH} == "arm64" ]]; then
  gnuarch="aarch"
  hash="77e4b0fbe2b02ec562df2a3da7f80142d26d0b9a09c0a1c98fa8d6b1aaad3d3b"
else
  gnuarch="x86_"
  hash="408653fa59cbfcc0e11c4efcb57ea74084b87b618b0e1fa65562afd11b869042"
fi
url="https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/${gives}-${pkgver}.linux-${gnuarch}64.tar.bz2"
homepage='https://floorp.app/'
pkgdesc="Firefox-based Browser build for keeping the Open, Private and Sustainable Web alive"
maintainer="Oren Klopfer <oren@taumoda.com>"
arch=('amd64' 'arm64')
if [[ ${CARCH} == "arm64" ]]; then
  fancy_message warn "Floorp is not running properly on ${BBlue}arm64${NC}. It should only be installed for development."
  if [[ ! -f "${METADIR}/${name}-override" && ${PWD} == "/tmp/pacstall" ]]; then
    if ask "[${BYellow}*${NC}] ${BOLD}WARNING${NC}: Cancel installation?" Y; then
      exit
    fi
  fi
fi

package() {
  if [[ ${CARCH} == "arm64" ]]; then
    sudo mkdir -p "${pkgdir}/${METADIR}"
    sudo touch "${pkgdir}/${METADIR}/${name}-override"
  fi
  cd ..
  sudo mkdir -p "${pkgdir}/usr/lib/floorp"
  sudo cp -r floorp/* "${pkgdir}/usr/lib/floorp"
  sudo chmod +x "${pkgdir}/usr/lib/floorp/floorp"
  sudo chmod +x "${pkgdir}/usr/lib/floorp/floorp-bin"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
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
Exec=/usr/lib/floorp/floorp --class="floorp" --ProfileManager' | sudo tee "${pkgdir}/usr/share/applications/floorp.desktop" > /dev/null
}

post_install() {
  sudo ln -sf "/lib/floorp/floorp" "/usr/bin/floorp"
  sudo ln -sf "/lib/floorp/floorp-bin" "/usr/bin/floorp-bin"
}

post_remove() {
  sudo rm -f "/usr/bin/floorp" "/usr/bin/floorp-bin"
}
