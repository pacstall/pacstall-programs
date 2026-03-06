pkgname="lazydocker-bin"
gives="lazydocker"
repology=("project: ${gives}")
arch=('amd64' 'arm64')
pkgver="0.24.4"
url='https://github.com/jesseduffield/lazydocker'
source_amd64=("https://github.com/jesseduffield/lazydocker/releases/download/v${pkgver}/lazydocker_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("https://github.com/jesseduffield/lazydocker/releases/download/v${pkgver}/lazydocker_${pkgver}_Linux_arm64.tar.gz")
sha256sums_amd64=("c47e6f4b61debde5422183c7eb446a704a92c58b4c35bbd128c722d8bf269a86")
sha256sums_arm64=("0fcf85b736895f46daa38eec5871ef1ca3d1e38b20201b2811b26258faccf1c7")
pacdeps=("docker-bin" "docker-compose-plugin-bin" "docker-buildx-plugin-bin")
pkgdesc="The lazier way to manage everything docker"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MIT')

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
