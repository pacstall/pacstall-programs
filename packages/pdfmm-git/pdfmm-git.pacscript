pkgname="pdfmm-git"
gives="pdfmm"
pkgdesc="pdfmm (for 'pdf minus minus', or 'pdf--') is a graphical assistant to reduce the size of PDF files."
source=("https://github.com/jpfleury/${gives}.git")
arch=("any")
pkgver="0.0.1"
depends=("bash" "sed" "zenity" "ghostscript")
breaks=("${gives}")
sha256sums=("3a1d5046490cbeb1f3a3eae34d66ea0e714a19a01f15dc43cb1d31fbb58d7a51")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

package() {
  cd "pdfmm"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
