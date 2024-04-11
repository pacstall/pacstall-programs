pkgname="genymotion-bin"
gives="genymotion"
repology=("project: genymotion")
pkgver="3.6.0"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=("amd64")
sha256sums=("092d40f6e76de3b6e1827609aaa9021b7cf85da3d51e6cf8d7b553b18d9c70e0")
source=("https://dl.genymotion.com/releases/genymotion-${pkgver}/genymotion-${pkgver}-linux_x64.bin")
url="https://genymotion.com"
pkgdesc="Android virtual devices"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")

_GENYMOTION_FILE="./genymotion-${pkgver}-linux_x64.bin"
_GENYMOTION_INSTALLDIR="${pkgdir}/opt/genymotion"

prepare() {
  cd "${_archive}"
  rm -rf "/opt/${gives}"
  mkdir -p "${_GENYMOTION_INSTALLDIR}"

  chmod +x "${_GENYMOTION_FILE}"
}

package() {
  cd "${_archive}"
  # Retrieve line number where tar.bzip2 binary begins
  local skip
  skip=$(awk "/^__TARFILE_FOLLOWS__/ { print NR + 1; exit 0; }" "${_GENYMOTION_FILE}")

  # Untar following archive
  if ! tail -n +"${skip}" "${_GENYMOTION_FILE}" | tar -xj --no-same-owner -C "${_GENYMOTION_INSTALLDIR}"; then
    return 1
  fi

    install -Dm644 "/dev/stdin" "${pkgdir}/usr/share/applications/${gives}.desktop" <<- END
[Desktop Entry]
Type=Application
Version=1.0
Name=Genymotion
Comment=Virtual environment for Android.
Exec=/opt/genymotion/genymotion
Icon=/opt/genymotion/icons/genymotion-logo.png
Terminal=false
Categories=Development;
END
}

post_remove() {
  sudo rm -rf "/opt/${gives}"
}
