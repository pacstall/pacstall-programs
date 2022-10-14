name="firefox-developer-edition-bin"
maintainer="Paul Cosma (saenai255) <paul.cosma97@gmail.com>"
pkgname="firefox-developer-edition"
pkgdir="${STOWDIR}/${name}"
version="106.0b9"
description="The browser made for developers. All the latest developer tools in beta, plus experimental features like the Multi-line Console Editor and WebSocket Inspector."
url="https://download-installer.cdn.mozilla.net/pub/devedition/releases/${version}/linux-x86_64/en-US/firefox-${version}.tar.bz2"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="d7cef4f3c7330ad8b2e92f70ed587d004df97967be2053feacf718b0eee228a7"
repology=("project: firefox-developer-edition")
__icon_url="https://www.mozilla.org/media/img/structured-data/logo-firefox-developer.8aedc8028e4d.png"

prepare() {
  true
}

build() {
  true
}

install() {
  # Make dirs and assign permissions
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo cp -r ./* "${pkgdir}"
  sudo touch "${pkgdir}/usr/bin/${pkgname}"
  sudo chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  # Make a shellscript proxy because copying the binary won't work
  sudo tee "${pkgdir}/usr/bin/${pkgname}" >/dev/null << END
#!/bin/bash
${pkgdir}/firefox "\$@"
END

  # Install the icon for the desktop file
  wget -O "${pkgname}.png" "${__icon_url}"
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
