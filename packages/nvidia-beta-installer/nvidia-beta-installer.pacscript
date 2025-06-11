pkgname='nvidia-beta-installer'
pkgver='575.51.02'
gives="${pkgname}-${pkgver%%.*}"
arch=('amd64')
maintainer=('Oren Klopfer <oren@taumoda.com>')
url='https://www.nvidia.com/en-us/drivers/unix/'
pkgdesc='NVIDIA driver installer with both proprietary and open source module options (Beta Branch)'
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run")
sha256sums=('5d9d0df084a6a000bca76f03ac61e4fd8375ac9b089c9d9d64d2fc3be4ee69ad')

package() {
  install -Dm755 "NVIDIA-Linux-x86_64-${pkgver}.run" -t "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/NVIDIA-Linux-x86_64-${pkgver}.run" "${pkgdir}/usr/bin/${gives}"
}

post_install() {
  strings=(
    '    NVIDIA Driver Post-Install Information    \n'
    '==============================================\n'
    'To run the installer, use one of the commands:\n'
    '```\n'
    "sudo ./${gives}\n"
    '# OR\n'
    "sudo ./NVIDIA-Linux-x86_64-${pkgver}.run\n"
    '```\n'
    'You may remove this package afterwards. Doing\n'
    'so will not remove any installed modules.\n'
    '==============================================\n'
  )
  echo -e "${strings[@]}"
}

pre_remove() {
  strings=(
    '    NVIDIA Driver Pre-Remove Information    \n'
    '============================================\n'
    'Reminder: this will not remove any installed\n'
    'modules, only the installer for them!\n'
    '============================================\n'
  )
  echo -e "${strings[@]}"
}
