#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="opendoas-git"
gives="opendoas"
pkgdesc="A portable fork of the OpenBSD doas command"
url="https://github.com/Duncaen/OpenDoas.git"
pkgver="6.8.2"
makedepends=("bison" "libpam0g-dev")
breaks=("${gives}" "${gives}-bin")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  ./configure --prefix=/usr --with-timestamp
  # Build rquired files
  make -j"${NCPU}" DESTDIR="${pkgdir}"
}

package() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install doas
  sudo make install DESTDIR="${pkgdir}"

  # Install config file
  sudo mkdir -p "${pkgdir}/etc"
  echo "permit persist ${LOGNAME} as root" | sudo tee "${pkgdir}/etc/doas.conf" > /dev/null
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}

# vim:set ft=sh ts=2 sw=2 et:
