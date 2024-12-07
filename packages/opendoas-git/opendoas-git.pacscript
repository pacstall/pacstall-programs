#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="opendoas-git"
gives="opendoas"
pkgdesc="A portable fork of the OpenBSD doas command"
source=("https://github.com/Duncaen/OpenDoas.git")
arch=("any")
pkgver="6.8.2"
makedepends=("bison" "libpam0g-dev")
breaks=("${gives}" "${gives}-bin")

build() {
  cd "OpenDoas"
  ./configure --prefix=/usr --with-timestamp
  # Build rquired files
  make -j"${NCPU}" DESTDIR="${pkgdir}"
}

package() {
  cd "OpenDoas"
  # Install license
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install doas
  make install DESTDIR="${pkgdir}"

  # Install config file
  mkdir -p "${pkgdir}/etc"
  echo "permit persist ${LOGNAME} as root" | tee "${pkgdir}/etc/doas.conf" > /dev/null
}

# vim:set ft=sh ts=2 sw=2 et:
