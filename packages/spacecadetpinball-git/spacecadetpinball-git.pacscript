#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="spacecadetpinball-git"
pkgname="spacecadetpinball"
description='Reverse engineered port of "3D Pinball for Windows – Space Cadet" to Linux'
url="https://github.com/k4zmu2a/${pkgname}.git"
depends=("timidity" "freepats" "libsdl2-2.0-0" "libsdl2-mixer-2.0-0")
build_depends=("libsdl2-dev" "libsdl2-mixer-dev" "unrar" "cmake")
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-app" "${pkgname}-deb")

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  # Download game data file
  wget -q 'https://archive.org/download/SpaceCadet_Plus95/Space_Cadet.rar'

  # Check checksum
  if [[ $(sha256sum ./Space_Cadet.rar | cut -d" " -f 1) != "3cc5dfd914c2ac41b03f006c7ccbb59d6f9e4c32ecfd1906e718c8e47f130f4a" ]]; then
    fancy_message error "Downloading game data file failed. Checksum mismatch"
    return 1
  fi

  unrar e -y Space_Cadet.rar Space_Cadet/
}

build() {
  cmake -B "build" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -j"$(nproc)" -C "build"
}

install() {
  # Install LICENSE
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install binary
  sudo install -Dm755 "bin/SpaceCadetPinball" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"

  # Install wrapper script
  sudo install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << END
#!/bin/sh
# Run program in correct directory so it can find it's resources
cd /usr/lib/${pkgname}
exec ./${pkgname} "\$@"
END

  # Install resources
  (
    cd Space_Cadet || return 1
    sudo install -m644 ./*.DAT ./*.DOC ./*.MID ./*.BMP ./*.INF ./*.WAV -t "${pkgdir}/usr/lib/${pkgname}"
  )

  # Install icon
  sudo install -Dm644 "SpaceCadetPinball/Icon_1.ico" "${pkgdir}/usr/lib/${pkgname}/icon.ico"

  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"

  if [[ $(sha256sum ./"${pkgname}".desktop | cut -d" " -f 1) != "6edc9d9e73f430b025d0efe09ecd9027d38f7c2e3562de470a8057939fb1889f" ]]; then
    fancy_message error "Downloading desktop file failed. Checksum mismatch"
    return 1
  fi
  # Install desktop launcher
  sudo install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
