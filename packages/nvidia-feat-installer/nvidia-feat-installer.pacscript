pkgname='nvidia-feat-installer'
pkgver='575.64.05'
gives="${pkgname}-${pkgver%%.*}"
arch=('amd64' 'arm64')
maintainer=('Oren Klopfer <oren@taumoda.com>')
url='https://www.nvidia.com/en-us/drivers/unix/'
pkgdesc='NVIDIA driver installer with both proprietary and open source module options (New Feature Branch)'
source_amd64=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run")
source_arm64=("https://us.download.nvidia.com/XFree86/aarch64/${pkgver}/NVIDIA-Linux-aarch64-${pkgver}.run")
sha256sums_amd64=('85f2b50f912261c1917a0b2cf7e1f9743affd008fdc0f209f4d5563f774d502d')
sha256sums_arm64=('19113d544128b1b63b4cbe073c5a32a3401ce638011ec660f6c04a27804b86c0')

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
