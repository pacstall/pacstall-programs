name="floorp-bin"
gives="floorp"
pkgver="11.7.1"
repology=("project: ${gives}")
if [[ ${CARCH} == "arm64" ]]; then
  gnuarch="aarch"
  hash="1b094fbb84fcf5214ec7da98364ccd6b88e5fbbe8f6b067cee7cad945a796f11"
else
  gnuarch="x86_"
  hash="af943e71ed5d5d43e58ea34a8e23e8fc543f8013b834bf961fb3852b3632143e"
fi
url="https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/${gives}-${pkgver}.linux-${gnuarch}64.tar.bz2"
homepage='https://floorp.app/'
pkgdesc="Firefox-based Browser build for keeping the Open, Private and Sustainable Web alive"
maintainer="Oren Klopfer <oren@taumoda.com>"
arch=('amd64' 'arm64')
if [[ ${CARCH} == "arm64" ]]; then
  fancy_message warn "Floorp is not running properly on ${BBlue}arm64${NC}. It should only be installed for development."
  if ask "[${BYellow}*${NC}] ${BOLD}WARNING${NC}: Cancel installation?" Y; then
    exit
  else
    return
  fi
fi

package() {
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
