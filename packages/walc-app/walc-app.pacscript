#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="walc-app"
gives="walc"
arch=("amd64")
pkgver="0.2.1"
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
source=("https://github.com/cstayyab/WALC/releases/download/v${pkgver}/${gives}.AppImage")
sha256sums=("6c1e5c004e9c4bc5a8cf15837ce0e6c884fb3ace6397aa6aa95a6738c1960560")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-deb")

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 "${gives}.AppImage" "${pkgdir}/usr/bin/${gives}"
}

post_remove() {
  # Remove .desktop file
  sudo rm -f "${homedir}/.local/share/applications/WALC.desktop"

  # Remove left over .config files
  if ask "Do you want to remove left over configuration files?" Y; then
    sudo rm -rf "${homedir}/.config/${gives}"
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
