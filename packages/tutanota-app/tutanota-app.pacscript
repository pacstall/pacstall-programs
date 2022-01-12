maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"

pkgname="tutanota"
name="${pkgname}-app"
version="1"
description="Tutanota is the world's most secure email service, easy to use and private by design."
url="https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage"
hash="2ac1ebeeb7be79236a9fc2db26da7a819f3bc52bc3a93bc39c1b7cb45a130673"
breaks="${pkgname}-deb ${pkgname}-bin ${pkgname}-git ${pkgname}"
gives="${pkgname}"
replace="${pkgname}"

prepare() {
  true
}

build() {
  true
}

__created_desktop_file="no"
install() {
  # Install appimage
  sudo install -Dm755 "tutanota-desktop-linux.AppImage" "${STOWDIR}/${name}/usr/bin/${pkgname}"

  # Download icon
  wget -O "${pkgname}.png" -q https://icons-for-free.com/download-icon-super+tiny+icons+tutanota-1324450784669328293_256.png "${pkgname}.png"
  sudo install -Dm644 "${pkgname}.png" "${STOWDIR}/${name}/usr/share/pixmaps/${pkgname}.png"

  if ask "\nTutanota creates its own desktop file during the first launch.\nDo you want to create a desktop file anyway?" N; then
    # Install .desktop file
    wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
    sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  else
    __created_desktop_file="yes"
  fi
}

postinst() {
  if [ "${__created_desktop_file}" = "yes" ]; then
    if ask "Do you want to run Tutanota now to set the desktop file?" Y; then
      echo 'Important!: Remember to click "Yes" when Tutanota prompts you to integrate with the desktop environment.'
      nohup tutanota &
    else
      echo "Important!: Remember to run $($ tutanota) to open Tutanota and create the desktop file."
    fi
  fi
}

removescript() {
  if ask "Do you want to delete desktop and config files?" Y; then
    rm -rf ~/.config/tutanota-desktop/
    rm -rf ~/.local/share/applications/tutanota*
  fi
}
