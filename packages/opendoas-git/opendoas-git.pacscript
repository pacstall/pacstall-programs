#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="opendoas-git"
pkgname="opendoas"
description="A portable fork of the OpenBSD doas command"
url="https://github.com/Duncaen/OpenDoas.git"
build_depends=("bison" "libpam0g-dev")
breaks=("${pkgname}" "${pkgname}-bin")

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

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
  echo "permit persist ${LOGNAME} as root" | sudo tee "${pkgdir}/etc/doas.conf" > /dev/null
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
