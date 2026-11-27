maintainer=("Tai Lam <taivlam-aur-mpr.tinsmith796@silomails.com>")

gives="tutanota"
pkgname="${gives}-app"
arch=("amd64")
pkgver="357.260901.0"
pkgrel=2
pkgdesc="Tutanota is the world's most secure email service, easy to use and private by design."
source=(
  "https://github.com/tutao/tutanota/releases/download/tutanota-desktop-release-${pkgver}/tutanota-desktop-linux.AppImage"
  "${gives}.png::https://raw.githubusercontent.com/tutao/tutanota/refs/heads/master/resources/desktop-icons/icon/512.png"
)
breaks=("${gives}-deb" "${gives}-bin" "${gives}-git" "${gives}")
replaces=("${gives}")
sha256sums=(
  "ba605c7dd7f33eb90939cf6c3fce05417dd2b68f69337d86499843aa743f019e"
  "d4bd07956e4b7e99d21e382dbdfdbbcaf9b26dfc270546444f41e54556f7e18e"
)
repology=("project: tutanota")

package() {
  cd "${srcdir}"
  # Install AppImage
  install -Dm755 "tutanota-desktop-linux.AppImage" "${pkgdir}/usr/bin/${gives}"

  # Install desktop application icon
  install -Dm644 "${srcdir}/${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install .desktop file
  mkdir -p "${pkgdir}/usr/share/applications"

  cat << EOF > "${pkgdir}/usr/share/applications/${gives}.desktop"
[Desktop Entry]
Version=1.0
Name=Tutanota
GenericName=Email Client
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/tutanota
Icon=tutanota
Terminal=false
X-MultipleArgs=false
Type=Application
StartupNotify=true
StartupWMClass=Tutanota
Categories=Email;Network;Office;
SingleMainWindow=true
EOF
}

post_remove() {
  if ask "Do you want to delete desktop and config files?" Y; then
    rm -rf ~/.config/tutanota-desktop/
    rm -rf ~/.local/share/applications/tutanota*
  fi
}
