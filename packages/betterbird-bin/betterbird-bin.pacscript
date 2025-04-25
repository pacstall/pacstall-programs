pkgname="betterbird-bin"
_pkgname="betterbird"
pkgver="128.9.0esr"
_build="bb24"
pkgrel="1"
pkgdesc="EN-US // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=("x86_64")
url="https://www.betterbird.eu/index.html"
depends=("libdbus-glib-1-2" "hunspell")
optdepends=("hunspell-en_US: English dictionary support")
provides=("betterbird=${pkgver}")
source=(
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.en-US.linux-x86_64.tar.bz2"
    "eu.betterbird.Betterbird.desktop"
)
sha256sums=(
    "7d1b91d6c2bb4c7b7555b47fcf127cde3fa67bfa48848ccf2dd58bc933e6b34d"
    "bce809385dc48951ca6309776ed8fe5213ebbce301a790349172a799d8987151"
    "b11745416d2b2f8bac1ccd3dcb99411c7239b067adf9eb973903c448f8747d09"
)

package() {
    # Create directories
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    # Install main files
    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/eu.${_pkgname}.Betterbird.desktop" "${pkgdir}/usr/share/applications/eu.${_pkgname}.Betterbird.desktop"
    
    # Create symlinks
    ln -s "/opt/${_pkgname}/betterbird" "${pkgdir}/usr/bin/${_pkgname}"

    # Install icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/"
        ln -s "/opt/${_pkgname}/chrome/icons/default/default${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
    done
}
