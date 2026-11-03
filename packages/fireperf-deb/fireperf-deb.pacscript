pkgname="fireperf-deb"
gives="fireperf"
pkgver="0.3.0-1.build-271.1"
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
sha256sums_amd64=("1041aca64227105562990dac43c63a7f480ee5e6c706afeb3577e7142c28dbae")
sha256sums_arm64=("3c27b7949ba07b38fb3269dbc7c0fa48e87689e1fd7fcf452aa81d6acf9db178")

post_install() {
  fancy_message info "fireperf.service listens on TCP port 5001 by default; enable it with 'sudo systemctl enable --now fireperf.service'."
}
