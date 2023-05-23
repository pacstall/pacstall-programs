name="rhino-core"
url="https://github.com/oklopfer/debs/raw/master/empty.tar.xz"
pacdeps=("unicorn-desktop-git" "rhino-kvantum-theme-git" "rhino-plymouth-theme-git" "rhino-pkg-git" "rhino-neofetch-git")
depends=("unicorn-desktop" "rhino-kvantum-theme" "rhino-plymouth-theme" "rhino-pkg" "rhino-neofetch")
description="Transitional package to provide all core Rhino Linux software"
maintainer="Oren Klopfer <oren@taumoda.com>"
replace=("rhino-pine-core" "rhino-server-core")
production="2023.1-beta5"
version="${production}-0"
style="(mainline)"
branch="devel"
postinst() {
  echo "PRETTY_NAME=\"Rhino Linux ${production} ${style}\"
NAME=\"Rhino Linux\"
VERSION_ID=\"${production}\"
VERSION=\"${production} ${style}\"
VERSION_CODENAME=\"${branch}\"
ID=ubuntu
ID_LIKE=debian
HOME_URL=\"https://rhinolinux.org/\"
SUPPORT_URL=\"https://github.com/rhino-linux\"
BUG_REPORT_URL=\"https://github.com/rhino-linux\"
PRIVACY_POLICY_URL=\"https://www.ubuntu.com/legal/terms-and-policies/privacy-policy\"
UBUNTU_CODENAME=\"${branch}\"" | sudo tee /usr/lib/os-release > /dev/null
}
