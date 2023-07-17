name="pdfmm-git"
pkgname="pdfmm"
description="pdfmm (for 'pdf minus minus', or 'pdf--') is a graphical assistant to reduce the size of PDF files."
url="https://github.com/jpfleury/${pkgname}.git"
depends=("bash" "sed" "zenity" "ghostscript")
breaks=("${pkgname}")
hash="3a1d5046490cbeb1f3a3eae34d66ea0e714a19a01f15dc43cb1d31fbb58d7a51"
pkgver() {
  git ls-remote "https://github.com/jpfleury/${pkgname}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
