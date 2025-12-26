pkgname="mcontrolcenter-bin"
gives="mcontrolcenter"
arch=("amd64")
pkgver="0.5.0"
depends=("libqt5widgets5")
source=("@${pkgname}~${pkgver}::https://github.com/dmitry-s93/MControlCenter/releases/download/${pkgver}/MControlCenter-${pkgver}-bin.tar.gz")
repology=("project: mcontrolcenter")
pkgdesc="MControlCenter is a Free and Open Source GNU/Linux application that allows you to change the settings of MSI laptops."
sha256sums=("b5507918e229b15d06f1829f5d9fcc062a1c9d430468170ef4d31fdc4e8a8907")
maintainer=("সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>")

package() {
  cd "${pkgname}~${pkgver}"
  cd app || return 1
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
  install -Dm644 "${gives}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${gives}.svg"
  install -Dm755 "${gives}-helper" "${pkgdir}/usr/libexec/${gives}-helper"
  install -Dm644 "${gives}-helper.conf" "${pkgdir}/usr/share/dbus-1/system.d/${gives}-helper.conf"
  install -Dm644 "${gives}.helper.service" "${pkgdir}/usr/share/dbus-1/system-services/${gives}.helper.service"
}

post_install() {
  if ask "Do you want this program to start at startup?" Y; then
    sudo -u "${PACSTALL_USER}" mkdir -p "${homedir}/.config/autostart"
    sudo -u "${PACSTALL_USER}" cp /usr/share/applications/mcontrolcenter.desktop "${homedir}/.config/autostart/mcontrolcenter.desktop"
    echo "Copied desktop file to ${homedir}/.config/autostart folder, program will now start upon startup"
  else
    echo "Program will not start upon startup"
  fi
}

post_remove() {
  if [[ -f "${homedir}/.config/autostart/mcontrolcenter.desktop" ]]; then
    rm -f "${homedir}/.config/autostart/mcontrolcenter.desktop"
    fancy_message info "Config file for auto-start is removed"
  fi
}
