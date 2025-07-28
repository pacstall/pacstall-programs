pkgname='nvidia-prod-installer'
pkgver='570.172.08'
gives="${pkgname}-${pkgver%%.*}"
arch=('amd64' 'arm64')
maintainer=('Oren Klopfer <oren@taumoda.com>')
url='https://www.nvidia.com/en-us/drivers/unix/'
pkgdesc='NVIDIA driver installer with both proprietary and open source module options (Production Branch)'
source_amd64=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run")
source_arm64=("https://us.download.nvidia.com/XFree86/aarch64/${pkgver}/NVIDIA-Linux-aarch64-${pkgver}.run")
sha256sums_amd64=('0256867e082caf93d7b25fa7c8e69b316062a9c6c72c6e228fad7b238c6fa17d')
sha256sums_arm64=('15547216f2b514ace7724a5ab4c3327669904a41cafb8d4d9048d3c9b60963d8')

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
    "sudo ${gives}\n"
    '# OR\n'
    "sudo NVIDIA-Linux-x86_64-${pkgver}.run\n"
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
