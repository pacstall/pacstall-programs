pkgname="upk-git"
pkgver="1.2.0.r0.g6ae333d"
pkgrel=1
pkgdesc="Ubuntu Package Kit - Universal package manager wrapper (Git version)"
arch=('any')
url="https://github.com/undefinederror/upk"
license=('MIT')
depends=('python3' 'python3-click' 'python3-rich')
recommends=('nala' 'snapd' 'flatpak' 'pacstall')
provides=("upk")
conflicts=("upk")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    return 0
}

build() {
    return 0
}

package() {
    cd "${srcdir}/${pkgname}"
    
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib/python3/dist-packages/upk"
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
    
    cp -r backends "${pkgdir}/usr/lib/python3/dist-packages/upk/"
    cp config.py "${pkgdir}/usr/lib/python3/dist-packages/upk/"
    cp display.py "${pkgdir}/usr/lib/python3/dist-packages/upk/"
    cp search.py "${pkgdir}/usr/lib/python3/dist-packages/upk/"
    cp utils.py "${pkgdir}/usr/lib/python3/dist-packages/upk/"
    cp upk.py "${pkgdir}/usr/lib/python3/dist-packages/upk/"
    cp VERSION "${pkgdir}/usr/lib/python3/dist-packages/upk/"
    
    cat > "${pkgdir}/usr/bin/upk" << 'EOF'
#!/bin/bash
cd /usr/lib/python3/dist-packages/upk
exec python3 upk.py "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/upk"
    
    export PYTHONPATH="${pkgdir}/usr/lib/python3/dist-packages/upk:${PYTHONPATH}"
    if python3 -c "import click, rich" &>/dev/null; then
        _UPK_COMPLETE=bash_source python3 "${pkgdir}/usr/lib/python3/dist-packages/upk/upk.py" > "${pkgdir}/usr/share/bash-completion/completions/upk" || true
    fi
}
