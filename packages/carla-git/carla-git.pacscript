pkgname="carla-git"
gives="carla"
pkgver="2.5.1.r415.gdd092c74a"
pkgdesc="Audio Plugin Host"
arch=('x86_64')
url='https://kx.studio/Applications:Carla'
license=("GPL-2.0")
conflicts=("${pkgname}" "${gives}")
provides=("${gives}" 'clap-host' 'dssi' 'ladspa-sdk' 'lv2-dev' 'vst3-host' 'vst-host')
depends=('libasound2' 'libgcc-s1' 'libc6' 'hicolor-icon-theme' 'libglvnd0' 'libx11-6'
  'libxcursor1' 'libxrandr2' 'python3-pyqt5' 'qtbase5-dev' 'libqt5svg5-dev')
makedepends=('file' 'fluidsynth' 'libfreetype6-dev' 'git' 'liblo7' 'libsndfile1' 'qttools5-dev-tools')
optdepends=(
  'jackd2: for using carla with JACK'
  'lv2-dev: for the LV2 plugin'
  'vst-host: for the VST plugin (no direct Debian package, use carla)'
  'python3-liblo: OSC control support'
  'python3-rdflib: LADSPA-RDF support'
)
maintainer=("aKqir24 <aKqir24@github.com>")
source=("https://github.com/falkTX/${gives}.git")

build() {
  cd "${gives}"
  make features
  make -j"${NCPU}" \
    DEFAULT_QT=5 \
    HAVE_QT4=false
}

package() {
  depends+=('libasound.so' 'libfluidsynth.so' 'libfreetype.so' 'libGL.so'
    'liblo.so' 'libmagic.so' 'libsndfile.so')
  cd "${gives}"
  make \
    DEFAULT_QT=5 \
    HAVE_QT4=false \
    DESTDIR="${pkgdir}" \
    PREFIX=/usr \
    install
}
