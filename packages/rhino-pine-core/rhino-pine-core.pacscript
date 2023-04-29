name="rhino-pine-core"
url="https://github.com/oklopfer/debs/raw/master/empty.tar.xz"
pacdeps=("rhino-xfce4-mobile-config-git" "xfce4-settings-pine-git" "rhino-kvantum-theme-git" "rhino-plymouth-theme-git" "rhino-pkg-git" "rhino-neofetch-git" "u-boot-mobian-deb")
description="Transitional package to provide all core Rhino Linux Mobile software"
maintainer="oklopfer <oren@taumoda.com>"
replace=("rhino-core" "rhino-server-core")
version="2023.1-beta4"
style="(mobile)"
branch="devel"
postinst() {
  echo "PRETTY_NAME=\"Rhino Linux ${version} ${style}\"
NAME=\"Rhino Linux\"
VERSION_ID=\"${version}\"
VERSION=\"${version} ${style}\"
VERSION_CODENAME=\"${branch}\"
ID=ubuntu
ID_LIKE=debian
HOME_URL=\"https://rhinolinux.org/\"
SUPPORT_URL=\"https://github.com/rhino-linux\"
BUG_REPORT_URL=\"https://github.com/rhino-linux\"
PRIVACY_POLICY_URL=\"https://www.ubuntu.com/legal/terms-and-policies/privacy-policy\"
UBUNTU_CODENAME=\"${branch}\"" | sudo tee /usr/lib/os-release > /dev/null
}
