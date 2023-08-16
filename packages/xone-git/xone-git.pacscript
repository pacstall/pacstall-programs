name="xone-git"
pkgname="xone"
pkgdesc="Linux kernel driver for Xbox One and Xbox Series X|S accessories"
pkgver="0.3"
provides=('xone')
homepage='https://github.com/medusalix/xone#readme'
url="https://github.com/medusalix/xone.git"
arch=('amd64')
makedepends=('cabextract')
depends=('dkms' 'linux-headers-generic')
optdepends=("linux-headers-$(uname -r): Linux kernel headers for the currently installed version")
maintainer="FelisDiligens <47528453+FelisDiligens@users.noreply.github.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  # We can't use "git describe" because the repo is cloned shallowly by pacstall...
  # version=$(git describe --tags 2> /dev/null || echo unknown) # "v0.3-2-gbbf0dcc"
  version="v${pkgver}-$(git rev-parse HEAD | cut -c1-8)" # "v0.3-bbf0dcc4", close enough...
  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/${version}/" {} +

  sudo install -dm755 "${pkgdir}/usr/src/xone-${version}"
  sudo cp -r ./* "${pkgdir}/usr/src/xone-${version}"

  sudo install -D -m 644 install/modprobe.conf "${pkgdir}/etc/modprobe.d/xone-blacklist.conf"

  driver_url='http://download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab'
  firmware_hash='48084d9fa53b9bb04358f3bb127b7495dc8f7bb0b3ca1437bd24ef2b6eabdf66'

  curl -L -o driver.cab "${driver_url}"
  cabextract -F FW_ACC_00U.bin driver.cab
  if echo "${firmware_hash}" FW_ACC_00U.bin | sha256sum -c; then
    sudo install -D -m 644 "${srcdir}/FW_ACC_00U.bin" "${pkgdir}/usr/lib/firmware/xow_dongle.bin"
  else
    return 1
  fi
}

post_install() {
  version="$(find /usr/src -maxdepth 1 -type d -name "xone-*" | head -n 1 | sed 's|/usr/src/xone-||')"

  sudo dkms install -m xone -v "${version}"

  # Avoid conflicts between xpad and xone
  if lsmod | grep -q '^xpad'; then
    sudo modprobe -r xpad
  fi

  # Avoid conflicts between mt76x2u and xone
  if lsmod | grep -q '^mt76x2u'; then
    sudo modprobe -r mt76x2u
  fi
}

post_remove() {
  modules=$(lsmod | grep '^xone_' | cut -d ' ' -f 1 | tr '\n' ' ')

  if [[ -n ${modules} ]]; then
    read -ra modules_array <<< "${modules}"
    sudo modprobe -r -a "${modules_array[@]}" # SC2086
  fi

  # There is no pre_remove() function, so we cannot run "dkms remove" before removing "dkms.conf".
  # Therefore we have to delete the modules manually:
  sudo rm -rfv /var/lib/dkms/xone
  sudo rm -rfv /lib/modules/**/updates/dkms/xone-*.ko
}
