pkgname="jq-bin"
gives="jq"
arch=("amd64" "arm64" "armel" "armhf" "i386" "ppc64el" "riscv64" "s390x")
pkgver="1.8.1"
repology=("project: ${gives}")
license=("MIT")
url='https://jqlang.org/'
source=("https://github.com/jqlang/${gives}/releases/download/${gives}-${pkgver}/${gives}-linux-${CARCH}")
pkgdesc="Lightweight and flexible command-line JSON processor"
maintainer=("Don Alfons <donnisnoni@outlook.com>")
sha256sums_amd64=("020468de7539ce70ef1bceaf7cde2e8c4f2ca6c3afb84642aabc5c97d9fc2a0d")
sha256sums_arm64=("6bc62f25981328edd3cfcfe6fe51b073f2d7e7710d7ef7fcdac28d4e384fc3d4")
sha256sums_armel=("b98e283ff26cd7478f6fb18cc081ca0e0cb2e9980300f0bfc8bb26854d347eb2")
sha256sums_armhf=("ac304e50cf7cd24933d83dc7d0e4f79892a71a92fb02336d4ecaffa8933760bd")
sha256sums_i386=("ee8489cb8acfddf2e6d2ab4308877b5cbb6ec6b55beedb7c6d5a4fafb2879c86")
sha256sums_ppc64el=("cb10b38f4e5ebb3904f383f24944a6c03a373b4b125d2928ccf52f8ea78f6f73")
sha256sums_riscv64=("3d7274ea14254f0220b6a6d1b8756a957f739b6a20e3886358377e8ea6687cf6")
sha256sums_s390x=("b792df2f5cced0404a5fd3796d7d47625dc087b3e3dcaa81017088590bb2f3a1")

package() {
  install -Dm755 "${gives}-linux-${CARCH}" -T "${pkgdir}/usr/bin/jq"
}
