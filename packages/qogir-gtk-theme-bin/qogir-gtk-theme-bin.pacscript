name="qogir-gtk-theme-bin"
pkgname="qogir-gtk-theme"
pkgdir="${STOWDIR}/${name}"
version="2021-12-25"
description="Qogir is a flat Design theme for GTK"
url="https://github.com/vinceliuice/Qogir-theme/archive/${version}.tar.gz"
depends="gtk3-engines-unico gtk2-engines-murrine gtk2-engines-pixbuf"
build_depends="libsass1"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="fb6b55b88dd6d69814ccd877efc227f3f62c4c73d1cf407bb02d5b93ee345023"

# To specify flags for theme installation you have two options
# 1. Edit _INSTALL_OPTS, and specify flags there
# 2. Edit /etc/qogir-gtk-theme/options.txt to permanently store your install flags
# NOTE: _INSTALL_OPTS will override /etc/qogir-gtk-theme/options.txt (if it exists) temporarily
# Otherwise, if none of the options are used. The script will proceed with the default installation
_INSTALL_OPTS=

prepare() {
  true
}

build() {
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

install() {
  sudo install -dm755 "${pkgdir}/usr/share/themes"
  # HACK: Disabling SC2086 check, as this is the desired behavior
  # shellcheck disable=SC2086
  sudo ./install.sh ${_INSTALL_OPTS} --dest "${pkgdir}/usr/share/themes"
}
# vim:set ft=sh ts=2 sw=2 et:
