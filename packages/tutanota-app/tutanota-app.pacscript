maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"

pkgname="tutanota"
name="${pkgname}-app"
pkgver="218.240227.0"
pkgdesc="Tutanota is the world's most secure email service, easy to use and private by design."
url="https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage"
__icon_url="https://icons-for-free.com/download-icon-super+tiny+icons+tutanota-1324450784669328293_256.png"
__icon_hash="e76f83c33cab7c3b1e7d4c827927e0c883bc7f41cb2e2f3ce7d493cd96970d76"
breaks=("${pkgname}-deb" "${pkgname}-bin" "${pkgname}-git" "${pkgname}")
gives="${pkgname}"
replace=("${pkgname}")
hash="2acd38e99da3c9c39beb7ab7835ea726b1e9687d05247f9cf9919395d7c79652"
repology=("project: tutanota" "repo: homebrew_casks")

__created_desktop_file="yes"
package() {
  # Install AppImage
  sudo install -Dm755 "tutanota-desktop-linux.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  if ask "\nTutanota creates its own desktop file during the first launch.\nDo you want to create a desktop file anyway?" N; then
    # Download icon
    wget -O "${pkgname}.png" -q "${__icon_url}" "${pkgname}.png"
    actual_icon_hash="$(sha256sum "${pkgname}.png" | grep -o "[a-z0-9]*" | head -1)"

    # Check hash
    if [[ ${__icon_hash} != "${actual_icon_hash}" ]]; then
      echo "Error! Tutanota icon hash mismatch"
      return 1
    fi

    # Install .desktop file
    sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
    sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  else
    __created_desktop_file="no"
  fi
}

post_install() {
  # Return early if nothing else to do
  if [[ ${__created_desktop_file} == "yes" ]]; then
    return 0
  fi

  if ask "Do you want to run Tutanota now to set the desktop file?" Y; then
    echo 'Important!: Remember to click "Yes" when Tutanota prompts you to integrate with the desktop environment.'
    nohup tutanota &
  else
    echo "Important!: Remember to run $($ tutanota) to open Tutanota and create the desktop file."
  fi
}

post_remove() {
  if ask "Do you want to delete desktop and config files?" Y; then
    rm -rf ~/.config/tutanota-desktop/
    rm -rf ~/.local/share/applications/tutanota*
  fi
}
