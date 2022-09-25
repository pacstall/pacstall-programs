name="gfn-electron-bin"
pkgname="geforcenow-electron"
version="1.9.0"
description="Linux desktop client for GeForce NOW, using Electron"
repology=("project: geforcenow-electron")
url="https://github.com/hmlendea/gfn-electron/releases/download/v${version}/geforcenow-electron_${version}_linux.zip"
hash="8c97a92f9363b6465cf0a92f15d5e396d2691d86ae72df90b009c64712dbe320"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

depends="libva2 libva-glx2 libva-drm2 libva-wayland2 libva-x11-2"

prepare() {
    true
}

build() {
    true
}

install() {
    # Get icon from github and install it
    wget -q "https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png"
    sudo install -Dm644 icon.png "${STOWDIR}/${name}/usr/share/pixmaps/nvidia.png"

    # Install desktop file
    sudo install -Dm644 ${SRCDIR}/com.github.hmlendea.${pkgname}.desktop -t "${STOWDIR}/${name}/usr/share/applications"

    # Install the rest of the app
    sudo install -d "${STOWDIR}/${name}/opt/${pkgname}/" "${STOWDIR}/${name}/usr/bin"

    sudo cp -r ${SRCDIR}/* ${STOWDIR}/${name}/opt/${pkgname}/
    sudo chmod +x "${STOWDIR}/${name}/opt/${pkgname}/geforcenow-electron"

    sudo ln -s -r "${STOWDIR}/${name}/opt/${pkgname}/geforcenow-electron" "${STOWDIR}/${name}/usr/bin/geforcenow"
}
