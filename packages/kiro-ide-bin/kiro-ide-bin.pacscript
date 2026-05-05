pkgname="kiro-ide-bin"
gives="kiro-ide"
repology=("project: kiro-ide")
pkgver="0.11.133"
pkgdesc="AI-powered IDE for modern development"
url='https://kiro.dev'
arch=('amd64')
# By downloading and using Kiro IDE, you agree to the following:
# AWS Customer Agreement: https://aws.amazon.com/agreement/
# AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
# Service Terms: https://aws.amazon.com/service-terms/
# Privacy Notice: https://aws.amazon.com/privacy/
license=('custom:Kiro')
depends=('libgtk-3-0' 'libnss3' 'libasound2' 'libxkbfile1')
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")
_base_url="https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed"
source=("${_base_url}/${pkgver}/tar/kiro-ide-${pkgver}-stable-linux-x64.tar.gz")
sha256sums=('0fc635c376266e02af369377b0bbfe1992dc4fb1c041a1a308bf5849dac76db0')

package() {
  install -d "${pkgdir}/opt/kiro-ide"
  cp -r "${srcdir}/Kiro/." "${pkgdir}/opt/kiro-ide/"
  chmod +x "${pkgdir}/opt/kiro-ide/kiro"
  chmod 4755 "${pkgdir}/opt/kiro-ide/chrome-sandbox"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/kiro-ide/kiro" "${pkgdir}/usr/bin/kiro-ide"

  # Desktop entry
  install -d "${pkgdir}/usr/share/applications"
  echo '[Desktop Entry]
Name=Kiro IDE
Comment=An AI-powered IDE for modern development
Exec=kiro-ide
Icon=kiro-ide
Type=Application
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=Kiro' | tee "${pkgdir}/usr/share/applications/kiro-ide.desktop" > /dev/null

  # Icon
  install -Dm644 "${srcdir}/Kiro/resources/app/resources/linux/code.png" \
    "${pkgdir}/usr/share/pixmaps/kiro-ide.png"
}
