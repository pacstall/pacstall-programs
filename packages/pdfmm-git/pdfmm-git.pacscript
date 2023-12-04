name="pdfmm-git"
gives="pdfmm"
pkgdesc="pdfmm (for 'pdf minus minus', or 'pdf--') is a graphical assistant to reduce the size of PDF files."
url="https://github.com/jpfleury/${gives}.git"
pkgver="0.0.1"
depends=("bash" "sed" "zenity" "ghostscript")
breaks=("${gives}")
hash="3a1d5046490cbeb1f3a3eae34d66ea0e714a19a01f15dc43cb1d31fbb58d7a51"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
