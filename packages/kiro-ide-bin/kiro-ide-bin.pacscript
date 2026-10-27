pkgname="kiro-ide-bin"
gives="kiro-ide"
repology=("project: kiro-ide")
pkgver="1.4.26"
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
sha256sums=('69dccc079e329fdc37cfc95c644ade47240a69a0674a6445c23242c43bc3270b')

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
Name=Kiro
Comment=An AI-powered IDE for modern development
GenericName=Text Editor
Exec=kiro-ide %F
Icon=kiro-ide
Type=Application
StartupNotify=false
StartupWMClass=kiro
Categories=TextEditor;Development;IDE;AI;
MimeType=application/x-kiro-workspace;
Actions=new-empty-window;
Keywords=kiro;

[Desktop Action new-empty-window]
Name=New Empty Window
Name[cs]=Nové prázdné okno
Name[de]=Neues leeres Fenster
Name[es]=Nueva ventana vacía
Name[fr]=Nouvelle fenêtre vide
Name[it]=Nuova finestra vuota
Name[ja]=新しい空のウィンドウ
Name[ko]=새 빈 창
Name[ru]=Новое пустое окно
Name[zh_CN]=新建空窗口
Name[zh_TW]=開新空視窗
Exec=kiro-ide --new-window %F
Icon=kiro-ide' | tee "${pkgdir}/usr/share/applications/kiro-ide.desktop" > /dev/null

  # URL handler entry (kiro:// protocol)
  echo '[Desktop Entry]
Name=Kiro - URL Handler
Comment=Alongside you from concept to production.
GenericName=Kiro
Exec=kiro-ide --open-url %U
Icon=kiro-ide
Type=Application
NoDisplay=true
StartupNotify=true
Categories=Utility;TextEditor;Development;IDE;
MimeType=x-scheme-handler/kiro;
Keywords=kiro;' | tee "${pkgdir}/usr/share/applications/kiro-ide-url-handler.desktop" > /dev/null

  # Workspace mimetype (*.code-workspace)
  install -d "${pkgdir}/usr/share/mime/packages"
  echo '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
	<mime-type type="application/x-kiro-workspace">
		<comment>Kiro Workspace</comment>
		<glob pattern="*.code-workspace"/>
	</mime-type>
</mime-info>' | tee "${pkgdir}/usr/share/mime/packages/kiro-workspace.xml" > /dev/null

  # Icon
  install -Dm644 "${srcdir}/Kiro/resources/app/resources/linux/code.png" \
    "${pkgdir}/usr/share/pixmaps/kiro-ide.png"
}

post_install() {
  update-desktop-database
  update-mime-database /usr/share/mime
}

post_remove() {
  update-desktop-database
  update-mime-database /usr/share/mime
}
