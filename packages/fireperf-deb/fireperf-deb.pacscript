pkgname="fireperf-deb"
gives="fireperf"
pkgver="0.3.0-1.build-332.1"
arch=("amd64" "arm64")
pkgdesc="Network benchmarking tool for firewalls and connection tracking"
url='https://www.ipfire.org/fireperf'
license=('GPL-3.0-or-later')
repology=("project: fireperf")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
depends=("libc6>=2.35" "libncursesw6>=6" "libtinfo6>=6" "liburing2>=2.3")
breaks=("${gives}")
replaces=("${gives}")
source=("https://repo.ipfire.org/debian/fireperf/master/pool/bookworm/main/${CARCH}/fireperf_${pkgver}_${CARCH}.deb")
sha256sums_amd64=("a7bebc771610b3c5cd42d310ae676827c91cc744f358e95eae100e88e647c01d")
sha256sums_arm64=("7b8dec5c4e6b803dd48c7f43c7e2f9a9153393230fd3872cfef2ef4cd4468102")

post_install() {
  fancy_message info "fireperf.service listens on TCP port 5001 by default; enable it with 'sudo systemctl enable --now fireperf.service'."
}
