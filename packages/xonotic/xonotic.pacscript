pkgname="xonotic"
gives="xonotic"
pkgver="0.8.6"
pkgdesc="The Free and Fast Arena Shooter"
url='https://xonotic.org/'
source=("@${pkgname}~${pkgver}::https://dl.unvanquished.net/share/xonotic/release/xonotic-${pkgver}.zip")
sha256sums=("50850f8d800e7499722f6ea61e478e96464a375494b5a24da93aa0598cbe964d")
breaks=("xonotic-git")
arch=('amd64')
maintainer=("Herisson <spaceguybox@outlook.com>")
repology=("project: xonotic")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "xonotic-linux64-sdl" "${pkgdir}/usr/bin/${gives}-sdl"
  install -Dm755 "xonotic-linux64-glx" "${pkgdir}/usr/bin/${gives}-glx"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/xonotic"
  cp -r ./* "${pkgdir}/usr/share/xonotic"
  echo "[Desktop Entry]
Type=Application
Version=0.8.6
Name=Xonotic
Comment=Multiplayer, deathmatch oriented first person shooter
Comment[de]=Deathmatch- und Mehrspieler-orientierter Ego-Shooter
Comment[fr]=Jeu de tir à la première personne multijoueur
Icon=xonotic
Exec=xonotic-sdl -basedir /usr/share/xonotic/
Terminal=false
PrefersNonDefaultGPU=true
StartupNotify=false
Categories=Game;ActionGame;" | tee "${pkgdir}/usr/share/applications/xonotic.desktop" > /dev/null
}
