pkgname="mcontrolcenter-bin"
gives="mcontrolcenter"
arch=("amd64")
pkgver="0.5.1"
depends=("libqt5widgets5")
source=("@${pkgname}~${pkgver}::https://github.com/dmitry-s93/MControlCenter/releases/download/${pkgver}/MControlCenter-${pkgver}-bin.tar.gz")
repology=("project: mcontrolcenter")
pkgdesc="MControlCenter is a Free and Open Source GNU/Linux application that allows you to change the settings of MSI laptops."
sha256sums=("704849b907a77e564056805413fda1e146ade91914c50fb26f508b79e26b41b0")
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
