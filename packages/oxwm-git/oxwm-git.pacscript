# Based of Tony <tony@tonybtw.com> PKGBUILD 

pkgname="oxwm-git"
pkgver="0.12.0.0.gdd25e8c"
arch=('amd64')
gives="oxwm"
url="https://github.com/tonybanters/oxwm"
pkgdesc="Window Manager Inspired by DWM, but with better sane defaults"
license=('GPL-3.0')
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true
pacdeps=("zig-bin")
depends=(
    'libfreetype6' 
    'libx11-6' 
    'libxft2' 
    'libxinerama1' 
    'libfontconfig1' 
    'liblua5.4-0'
)
makedepends=(
    'git' 
    'libfreetype6-dev' 
    'libx11-dev' 
    'libxft-dev' 
    'libxinerama-dev' 
    'libfontconfig1-dev' 
    'liblua5.4-dev'
)
provides=("${gives}")
conflicts=("${gives}")
source=("https://github.com/tonybanters/oxwm.git")

build() {
    cd "${gives}"
    zig build -j"${NCPU}" -Doptimize=ReleaseSmall --summary all
}

check() {
    cd "${gives}"
    zig build test -Doptimize=ReleaseSmall
}

package() {
    cd "${gives}"
    
    # Executable binaries
    install -Dm755 "zig-out/bin/oxwm" "${pkgdir}/usr/bin/oxwm"
    
    # Metadata, Licensing, and Desktop Environments
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 resources/oxwm.desktop "${pkgdir}/usr/share/xsessions/oxwm.desktop"
    install -Dm644 resources/oxwm.1 "${pkgdir}/usr/share/man/man1/oxwm.1"
    
    # Configuration Scripts
    install -Dm644 templates/oxwm.lua "${pkgdir}/usr/share/oxwm/oxwm.lua"
}