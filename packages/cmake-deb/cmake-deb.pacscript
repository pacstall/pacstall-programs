name="cmake-deb"
gives="cmake"
pkgver="3.28.1"
pkgdesc="CMake data files (modules, templates and documentation)"
arch=('amd64' 'arm64' 'armel' 'armhf' 'i386' 'mips64el' 'riscv64' 's390x')
pacdeps=("cmake-data-deb")
declare -A \
sums=(
  [amd64]="d4156a62233c735303fea7a8cb0f3302ac09225aa50e8bc5bdb0e3e9267c1092"
  [arm64]="7200f34b8aa13d3afc227f9cfdc37b94fac04d66839dc2bce3f6ca238dbd1c32"
  [armel]="f09f61884018c268579640f45ee402da89c2cea539ee9b57aecd478783ad761c"
  [armhf]="fa0714447f432caa4cb08981ea211bce0b907646c967795cfdfc21e1a64550f1"
  [i386]="17d54ba20beaedfe30026dd9cf9c8d4b2075ff5a5d1cb994a71b45a0acfd6fbb"
  [mips64el]="7acfa8c2bb1f78a9ccba90241c17b466681395f6465c726e37523ca385be3d86"
  [riscv64]="1fb86351ef025cf5549cba0a3f01a25955221e15cb02e00f18991988bf870268"
  [s390x]="e4eb1799ec52704f1467d89d7c033842c931d60158792b145e2106f1af9a25ac"
)

url="https://ftp.debian.org/debian/pool/main/c/cmake/cmake_${pkgver}-1_${CARCH}.deb"
hash="${sums[${CARCH}]}"

maintainer="Zahrun <Zahrun@github.com>"
repology=("project: ${gives}" "repo: debian_unstable")
