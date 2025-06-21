pkgname="goneovim-bin"
gives="goneovim"
pkgver="0.6.14"
source=("https://github.com/akiyosi/${gives}/releases/download/v0.6.14/${gives}-v${pkgver}-linux.tar.bz2")
sha256sums=("933476fef895963549674033123d1f19591d208b756d1da360586c6c57b551d9")
depends=("libxcb-xinerama0")
arch=('amd64')
maintainer=("Vaibhav Sharma <vvaibhavv3434@gmail.com>")
pkgdesc="Neovim GUI written in Go"
repology=("project: ${gives}")

package() {
  cd "${gives}-v${pkgver}-linux"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"

  cat <<- END > "${gives}.desktop"
	[Desktop Entry]
	Type=Application
	Name=Goneovim
	Comment=goneovim is a Neovim GUI written in Go.
	Icon=${gives}
	TryExec=${gives}
	Exec=${gives}
	Terminal=false
	Type=Application
	Keywords=Text;editor;
	Categories=Utility;TextEditor;
END

  install -Dm644 "${gives}.desktop" -t "${pkgdir}/usr/share/applications"
}
