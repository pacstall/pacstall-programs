#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="qogir-gtk-theme-bin"
gives="qogir-gtk-theme"
arch=("amd64")
pkgver="2024-05-22"
pkgdesc="Qogir is a flat Design theme for GTK"
source=("@${pkgname}~${pkgver}::https://github.com/vinceliuice/Qogir-theme/archive/${pkgver}.tar.gz")
depends=("gtk2-engines-murrine" "gtk2-engines-pixbuf")
makedepends=("libsass1")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("9ccebe06ef467f2628ddea7e5a6b09f671d486283a06f89eb7e888e01648dd5f")
repology=("project: qogir-theme" "repo: nix_unstable")

# To specify flags for theme installation you have two options
# 1. Edit _INSTALL_OPTS, and specify flags there
# 2. Edit /etc/qogir-gtk-theme/options.txt to permanently store your install flags
# NOTE: _INSTALL_OPTS will override /etc/qogir-gtk-theme/options.txt (if it exists) temporarily
# Otherwise, if none of the options are used. The script will proceed with the default installation
_INSTALL_OPTS=

build() {
  cd "${pkgname}~${pkgver}"
  # Parse install flags from /etc/qogir-gtk-theme/options.txt, if it exists and _INSTALL_OPTS has not been set
  if [[ -f "/etc/qogir-gtk-theme/options.txt" && -z ${_INSTALL_OPTS} ]]; then
    _INSTALL_OPTS="$(/usr/bin/grep --extended-regexp --max-count=1 --line-regexp --invert-match '^\s*$|#.+' /etc/qogir-gtk-theme/options.txt 2> /dev/null)"

    # HACK: Disabling SC2181 check, as the alternative would be much more verbose without much gain
    # shellcheck disable=2181
    if [[ $? -eq 0 ]]; then
      export _INSTALL_OPTS
      return 0
    fi
  fi
}

package() {
  cd "${pkgname}~${pkgver}"
  install -dm755 "${pkgdir}/usr/share/themes"
  # HACK: Disabling SC2086 check, as this is the desired behavior
  # shellcheck disable=SC2086
  ./install.sh ${_INSTALL_OPTS} --dest "${pkgdir}/usr/share/themes"
}
# vim:set ft=sh ts=2 sw=2 et:
