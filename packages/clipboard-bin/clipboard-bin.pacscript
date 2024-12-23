#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="clipboard-bin"
gives="clipboard"
pkgver="0.9.1"
pkgdesc="Cut, copy, and paste anything in your terminal"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64")
repology=("project: clipboard")
source=("@${pkgname}~${pkgver}::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${gives}-linux-${CARCH}.zip")
sha256sums_amd64=("20d616468b3b3e06c5434331c83b102ad86af101c9d94887c315d0e3497e8a0f")
sha256sums_arm64=("ac0ffb7cbbdb1c9ed43c52171c50b0a60546f3438af11c767a4fcefe319a95b1")
sha256sums_armhf=("8af12ddaf673b15a28ebd9d3f9e65720cea13bd6683e7761c5254255671d45a8")
sha256sums_ppc64el=("666a2421866c137a18851e9e3c43829b75a8c426af3b6d2b7def32c984fc0b04")
sha256sums_riscv64=("5fba87633d04887029cf3b3cb63cc10cc294a7b2de3c169e8dfb82a959f5d7fe")

package() {
  cd "${pkgname}~${pkgver}"
  if [[ ${CARCH} == "amd64" ]]; then
    install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  fi
  install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}

# vim:set ft=sh ts=2 sw=2 et:
