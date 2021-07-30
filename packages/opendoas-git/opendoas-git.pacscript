#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="opendoas-git"
pkgname="opendoas"
pkgdir="/usr/src/pacstall/${name}"
description="A portable fork of the OpenBSD doas command"
url="https://github.com/Duncaen/OpenDoas.git"
breaks="${pkgname} ${pkgname}-bin"
removescript="yes"

pkgver() {
  git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  ./configure --prefix=/usr --with-timestamp
  # Build rquired files
  make -j"$(nproc)" DESTDIR="${pkgdir}"
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install doas
  sudo make install DESTDIR="${pkgdir}"

  # Install config file
  sudo mkdir -p "${pkgdir}/etc"
  echo "permit persist $LOGNAME as root" | sudo tee "${pkgdir}/etc/doas.conf" > /dev/null
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
