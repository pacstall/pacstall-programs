pkgname="orchis-kde"
pkgdesc="Orchis KDE is a Materia Design theme for KDE Plasma desktop"
url='https://github.com/vinceliuice/Orchis-kde'
# CC-BY-SA is the license of SDDM theme, the rest is under GPL
license=("GPL-3.0-only" "CC-BY-SA-4.0")
arch=("any")
pkgver="2024-10-12"
source=("git+${url}#commit=036e831f545de829a7eaa65f0128322663d406e4")
optdepends=(
  "qt5-style-kvantum | qt6-style-kvantum: use Kvantum engine for better look"
  "orchis-gtk-theme: matching GTK theme"
)
maintainer=("bibelin <balian1belin@yandex.ru>")

package() {
  # Adopted from https://github.com/vinceliuice/Orchis-kde/blob/main/install.sh
  SRC_DIR="${PWD}/Orchis-kde"
  name="Orchis"

  AURORAE_DIR="${pkgdir}/usr/share/aurorae/themes"
  SCHEMES_DIR="${pkgdir}/usr/share/color-schemes"
  PLASMA_DIR="${pkgdir}/usr/share/plasma/desktoptheme"
  LOOKFEEL_DIR="${pkgdir}/usr/share/plasma/look-and-feel"
  KVANTUM_DIR="${pkgdir}/usr/share/Kvantum"
  WALLPAPER_DIR="${pkgdir}/usr/share/wallpapers"
  SDDM_DIR="${pkgdir}/usr/share/sddm/themes"

  mkdir -p "${AURORAE_DIR}"
  mkdir -p "${SCHEMES_DIR}"
  mkdir -p "${PLASMA_DIR}"
  mkdir -p "${LOOKFEEL_DIR}"
  mkdir -p "${KVANTUM_DIR}"
  mkdir -p "${WALLPAPER_DIR}"
  mkdir -p "${SDDM_DIR}"

  cp -r "${SRC_DIR}"/aurorae/* "${AURORAE_DIR}"
  cp -r "${SRC_DIR}"/color-schemes/*.colors "${SCHEMES_DIR}"
  cp -r "${SRC_DIR}"/Kvantum/* "${KVANTUM_DIR}"
  cp -r "${SRC_DIR}"/plasma/desktoptheme/"${name}" "${PLASMA_DIR}"
  cp -r "${SRC_DIR}"/plasma/desktoptheme/"${name}"-dark "${PLASMA_DIR}"
  cp -r "${SRC_DIR}"/plasma/desktoptheme/icons "${PLASMA_DIR}/${name}"
  cp -r "${SRC_DIR}"/plasma/desktoptheme/icons "${PLASMA_DIR}/${name}-dark"
  cp -r "${SRC_DIR}"/color-schemes/"${name}".colors "${PLASMA_DIR}/${name}/colors"
  cp -r "${SRC_DIR}"/color-schemes/"${name}"Dark.colors "${PLASMA_DIR}/${name}-dark/colors"
  cp -r "${SRC_DIR}"/plasma/look-and-feel/* "${LOOKFEEL_DIR}"
  cp -r "${SRC_DIR}"/wallpaper/* "${WALLPAPER_DIR}"
  cp -r "${SRC_DIR}"/sddm/6.0/"${name}" "${SDDM_DIR}"
}
