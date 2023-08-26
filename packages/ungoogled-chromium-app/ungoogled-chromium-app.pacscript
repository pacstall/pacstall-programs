name="ungoogled-chromium-app"
pkgver="116.0.5845.110-1.1"
_pkgver2="116.0.5845.110-1"
url="https://github.com/clickot/ungoogled-chromium-binaries/releases/download/${_pkgver2}/ungoogled-chromium_${pkgver}.AppImage"
pkgdesc="A lightweight approach to removing Google web service dependency from Chromium"
maintainer="Canute <convector@tutanota.com>"
hash="c29d442034470fac81d5e11d2d11d9437de5515cc9672ff96e8d1473cde49b91"
arch=('amd64')
_appimage="ungoogled-chromium_${pkgver}.AppImage"
_pkgname=ungoogled-chromium
homepage='https://ungoogled-software.github.io/ungoogled-chromium-binaries/'

prepare() {
    # Bypass integration
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract &>/dev/null
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    sudo install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"


    # Desktop file
    sudo touch /usr/share/applications/ungoogled-chromium.desktop


    echo '[Desktop Entry]
Version=1.0
Name=Ungoogled Chromium
GenericName=Web Browser
Exec=/usr/bin/ungoogled-chromium
StartupWMClass=chromium-browser
StartupNotify=true
Terminal=false
Icon=/usr/share/icons/chromium.png
Type=Application
Categories=Network;WebBrowser;
Keywords=chrome;internet;
MimeType=application/pdf;application/rdf+xml;application/rss+xml;application/xhtml+xml;application/xhtml_xml;application/xml;image/gif;image/jpeg;image/png;image/webp;text/html;text/xml;x-scheme-handler/http;x-scheme-handler/https;
Actions=new-window;new-private-window;
[Desktop Action new-window]
Name=New Window
Exec=/usr/bin/ungoogled-chromium
[Desktop Action new-private-window]
Name=New Incognito Window
Exec=/usr/bin/ungoogled-chromium --incognito' | sudo tee -a /usr/share/applications/ungoogled-chromium.desktop


    # Symlink executable
    sudo install -dm755 "${pkgdir}/usr/bin"
    sudo ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

post_install() {
  echo "Download Icon for Ungoogled Chromium, rename as chromium.png and save inside /usr/share/icons"
  echo "You may download icon from https://codeberg.org/cream/ungoogled-chromium-pacscript/raw/branch/main/Google-Chrome-Google-Chrome-Chromium.256.png"
}
