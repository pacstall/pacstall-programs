pkgname="lazydocker-bin"
gives="lazydocker"
repology=("project: ${gives}")
arch=('amd64' 'arm64')
pkgver="0.25.2"
url='https://github.com/jesseduffield/lazydocker'
source_amd64=("https://github.com/jesseduffield/lazydocker/releases/download/v${pkgver}/lazydocker_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("https://github.com/jesseduffield/lazydocker/releases/download/v${pkgver}/lazydocker_${pkgver}_Linux_arm64.tar.gz")
sha256sums_amd64=("0d9dbfc26068b218e7ed84b104748cadc6e3cf733c0afd35465306fb39b9523c")
sha256sums_arm64=("005c38b685aaa557e7d646d83a3dadb5024340eeed8c6a2e1949eee6f530de23")
pacdeps=("docker-bin" "docker-compose-plugin-bin" "docker-buildx-plugin-bin")
pkgdesc="The lazier way to manage everything docker"
license=('MIT')

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
