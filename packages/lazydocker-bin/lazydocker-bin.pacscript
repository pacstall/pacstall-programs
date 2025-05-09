pkgname="lazydocker-bin"
gives="lazydocker"
repology=("project: ${gives}")
arch=('amd64' 'arm64')
pkgver="0.24.1"
url='https://github.com/jesseduffield/lazydocker'
source_amd64=("https://github.com/jesseduffield/lazydocker/releases/download/v${pkgver}/lazydocker_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("https://github.com/jesseduffield/lazydocker/releases/download/v${pkgver}/lazydocker_${pkgver}_Linux_arm64.tar.gz")
sha256sums_amd64=("461cacf618e1020dff1d7896248c1c1f2267d5c25fb529755e4b9c43c5d1d4a5")
sha256sums_arm64=("c38e715f2cb56440bec16e3744005522c1d13c47d2e3730572849dc69cefd8ae")
pacdeps=("docker-bin" "docker-compose-plugin-bin" "docker-buildx-plugin-bin")
pkgdesc="The lazier way to manage everything docker"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MIT')

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
