pkgname="nvidia-driver-production-dkms-bundle"
gives="nvidia-driver"
pkgver="550.90.07"
pkgdesc="Nvidia Production Drivers + lib32"
arch=('amd64')
options=('!strip')
maintainer="xdavius <xdavius@github.com>"
makedepends=("patchelf" "wget")
depends=("dkms" "linux-headers-amd64" "libglvnd-dev" "libnvidia-egl-wayland-dev" "zlib1g-dev" "libc6:i386" "libglvnd-dev:i386")
breaks=("nvidia-driver" "nvidia-driver-any" "nvidia-driver-libs:i386" "nvidia-settings")
replaces=("nvidia-driver-functionality-dkms-bundle" "nvidia-driver-beta-dkms-bundle")
provides=("firmware-nvidia-gsp" "libcuda1" "libcudadebugger1" "libegl-nvidia0" "libgl1-nvidia-glvnd-glx" "libgles-nvidia1" "libgles-nvidia2" "libglx-nvidia0"
  "libnvcuvid1" "libnvidia-allocator1"
  "libnvidia-api1" "libnvidia-cfg1" "libnvidia-eglcore" "libnvidia-encode1" "libnvidia-fbc1" "libnvidia-glcore" "libnvidia-glvkspirv" "libnvidia-ml1"
  "libnvidia-ngx1" "libnvidia-nvvm4"
  "libnvidia-opticalflow1" "libnvidia-pkcs11-openssl3" "libnvidia-ptxjitcompiler1" "libnvidia-rtcore" "libnvoptix1" "nvidia-alternative" "nvidia-cuda-mps"
  "nvidia-detect"
  "nvidia-driver-bin" "nvidia-driver-full" "nvidia-driver-libs" "nvidia-egl-common" "nvidia-egl-icd" "nvidia-kernel-dkms" "nvidia-kernel-source"
  "nvidia-kernel-support" "nvidia-legacy-check"
  "nvidia-libopencl1" "nvidia-opencl-common" "nvidia-opencl-icd" "nvidia-powerd" "nvidia-smi" "nvidia-suspend-common" "nvidia-vdpau-driver"
  "nvidia-vulkan-common" "nvidia-vulkan-icd" "xserver-xorg-video-nvidia"
  "nvidia-driver-libs:i386" "nvidia-settings")

#incompatible=('ubuntu:*')

_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run")
sha256sums=('SKIP')
external_connection=true

create_links() {
  # create soname links
  find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
    [[ -e ${_soname} ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e ${_base} ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

create_links_32() {
  # create soname links
  for _lib in $(find "${pkgdir}" -name '*.so*' | grep -v 'xorg/'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e ${_soname} ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e ${_base} ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  cd "${_archive}"

  # ADD I386 ARCHITECTURE
  dpkg --add-architecture i386
  apt update

  # PATCHES

  # ARCHLINUX PATCHES AND CONF FILES

  patches_url="https://gitlab.archlinux.org/archlinux/packaging/packages/nvidia-utils/-/raw/550.90.07-2"

  wget ${patches_url}/nvidia-drivers-470.223.02-gpl-pfn_valid.patch
  wget ${patches_url}/nvidia.rules
  wget ${patches_url}/nvidia-drm-outputclass.conf
  wget ${patches_url}/nvidia-utils.sysusers

  # PREPARE

  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  tar -xf nvidia-persistenced-init.tar.bz2

  cd kernel

  sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
  sed -i 's/__JOBS/`nproc`/' dkms.conf
  sed -i 's/__DKMS_MODULES//' dkms.conf
  sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
BUILT_MODULE_NAME[4]="nvidia-peermem"\
DEST_MODULE_LOCATION[4]="/kernel/drivers/video"' dkms.conf

  # Gift for linux-rt guys
  sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

package() {
  cd "${_archive}"

  # ENTER FOLDER

  cd ${_pkg}

  # INSTALL LIB64 FROM NVIDIA-UTILS : /usr/lib/x86_64-linux-gnu/

  # Check http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/installedcomponents.html
  # for hints on what needs to be installed where.

  # LIB64

  install -Dm755 *.so* -t "${pkgdir}/usr/lib/x86_64-linux-gnu"

  # FIX DEPENDENCIES
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libGLESv1_CM.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libGLESv2.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libGL.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libGLX.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libGLdispatch.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libOpenCL.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libOpenGL.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libEGL.so.*
  rm ${pkgdir}/usr/lib/x86_64-linux-gnu/libnvidia-egl-wayland.so.*

  # X driver
  mkdir -p "${pkgdir}/usr/lib/xorg/modules/drivers"
  mv "${pkgdir}/usr/lib/x86_64-linux-gnu/nvidia_drv.so" "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

  # GLX extension module for X
  mkdir -p "${pkgdir}/usr/lib/xorg/modules/extensions"
  mv "${pkgdir}/usr/lib/x86_64-linux-gnu/libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglxserver_nvidia.so.${pkgver}"
  # Ensure that X finds glx
  ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglxserver_nvidia.so.1"
  ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglxserver_nvidia.so"

  # Wayland/GBM (LIB)
  mkdir -p "${pkgdir}/usr/lib/x86_64-linux-gnu/gbm"
  ln -sr "${pkgdir}/usr/lib/x86_64-linux-gnu/libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/gbm/nvidia-drm_gbm.so"

  # VDPAU
  mkdir -p "${pkgdir}/usr/lib/x86_64-linux-gnu/vdpau"
  mv "${pkgdir}/usr/lib/x86_64-linux-gnu/libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/x86_64-linux-gnu/vdpau/libvdpau_nvidia.so.${pkgver}"

  # DLSS (NGX) Wine DLL
  install -D -m644 {,_}nvngx.dll -t "${pkgdir}/usr/lib/nvidia/wine"

  # BINARIES

  # Debug
  install -Dm755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

  # nvidia-xconfig
  install -Dm755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
  install -Dm644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

  # nvidia-bug-report
  install -Dm755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

  # nvidia-smi
  install -Dm755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
  install -Dm644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"

  # nvidia-cuda-mps
  install -Dm755 nvidia-cuda-mps-server "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
  install -Dm755 nvidia-cuda-mps-control "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
  install -Dm644 nvidia-cuda-mps-control.1.gz "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

  # nvidia-modprobe
  # This should be removed if nvidia fixed their uvm module!
  install -Dm4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"
  install -Dm644 nvidia-modprobe.1.gz "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1.gz"

  # nvidia-persistenced
  install -Dm755 nvidia-persistenced "${pkgdir}/usr/bin/nvidia-persistenced"
  install -Dm644 nvidia-persistenced.1.gz "${pkgdir}/usr/share/man/man1/nvidia-persistenced.1.gz"
  install -Dm644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
  sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

  # nvidia-ngx-updater
  install -Dm755 nvidia-ngx-updater "${pkgdir}/usr/bin/nvidia-ngx-updater"

  # nvidia-settings
  install -Dm755 nvidia-settings "${pkgdir}/usr/bin/nvidia-settings"
  install -Dm644 nvidia-settings.1.gz "${pkgdir}/usr/share/man/man1/nvidia-settings.1.gz"
  install -D -m644 nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed \
    -e 's:__UTILS_PATH__:/usr/bin:' \
    -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' \
    -e 's/__NVIDIA_SETTINGS_DESKTOP_CATEGORIES__/Settings;HardwareSettings;/' \
    -e 's/Icon=.*/Icon=nvidia-settings/' \
    -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

  # MISC STUFFS

  # application profiles
  install -Dm644 nvidia-application-profiles-${pkgver}-rc "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-rc"
  install -Dm644 nvidia-application-profiles-${pkgver}-key-documentation "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-key-documentation"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nvidia-utils/LICENSE"
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
  install -Dm644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
  cp -r html "${pkgdir}/usr/share/doc/nvidia/"
  ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

  # new power management support
  install -Dm644 systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm755 systemd/system-sleep/nvidia "${pkgdir}/usr/lib/systemd/system-sleep/nvidia"
  install -Dm755 systemd/nvidia-sleep.sh "${pkgdir}/usr/bin/nvidia-sleep.sh"
  install -Dm755 nvidia-powerd "${pkgdir}/usr/bin/nvidia-powerd"
  install -Dm644 nvidia-dbus.conf "${pkgdir}"/usr/share/dbus-1/system.d/nvidia-dbus.conf

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -Dm644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

  install -Dm644 "${srcdir}/nvidia-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/$gives.conf"

  install -Dm644 "${srcdir}/nvidia.rules" "$pkgdir"/usr/lib/udev/rules.d/60-nvidia.rules

  echo "blacklist nouveau" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${gives}.conf"
  echo "nvidia-uvm" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${gives}.conf"

  # OpenCL
  install -Dm644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s nvidia-utils "${pkgdir}/usr/share/licenses/opencl-nvidia"

  # glvnd
  install -Dm644 "10_nvidia.json" "${pkgdir}/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

  # Vulkan ICD
  install -Dm644 "nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
  install -Dm644 "nvidia_layers.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

  # Wayland/GBM (.json)
  install -Dm644 15_nvidia_gbm.json "${pkgdir}/usr/share/egl/egl_external_platform.d/15_nvidia_gbm.json"

  # CREATE LIB64 SYMLINKS
  create_links

  # DKMS
  install -dm 755 "${pkgdir}"/usr/src
  cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

  install -Dt "${pkgdir}/usr/share/licenses/${gives}" -m644 "${srcdir}/${_pkg}/LICENSE"

  # FIRMWARES
  install -Dm644 -t "${pkgdir}/usr/lib/firmware/nvidia/${pkgver}/" firmware/*.bin
  install -Dm755 "nvoptix.bin" "${pkgdir}/usr/share/nvidia/nvoptix.bin"

  # LIB32
  # INSTALL LIB32 FROM LIB32-NVIDIA-UTILS : /usr/lib/i386-linux-gnu/
  cd 32

  install -Dm755 *.so* -t "${pkgdir}/usr/lib/i386-linux-gnu"

  #FIX DEPENDENCIES
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libEGL.so.*
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libGLdispatch.so.*
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libGLESv1_CM.so.*
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libGLESv2.so.*
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libGL.so.*
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libGLX.so.*
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libOpenCL.so.*
  rm ${pkgdir}/usr/lib/i386-linux-gnu/libOpenGL.so.*

  # VDPAU
  install -d "${pkgdir}/usr/lib/i386-linux-gnu/vdpau/"
  mv "${pkgdir}/usr/lib/i386-linux-gnu/libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/i386-linux-gnu/vdpau/libvdpau_nvidia.so.${pkgver}"

  # Licences
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/${gives}"

  # CREATE LIB32 SYMLINKS
  create_links_32
}

post_upgrade() {
  echo "--------------------------------------------------------------------------------------------------------------"
  echo "INSTALLATION NOTES :"
  echo ""
  echo "If you run into trouble with CUDA not being available, run nvidia-modprobe first."
  echo "If you use GDM on Wayland, you might have to run systemctl enable --now nvidia-resume.service"

  # For the latter nore, see also https://gitlab.gnome.org/GNOME/gdm/-/issues/784
  echo "If you experiment troubles with Wayland/Hyprland, Consider add nvidia-drm modeset=1 to modprobe.d :"
  echo ""
  echo 'echo "options nvidia-drm modeset=1" | sudo install -Dm644 /dev/stdin "/etc/modprobe.d/nvidia-drm.conf"'
  echo ""
  echo "Remove it by exécuting : sudo rm /etc/lib/modprobe.d/nvidia-drm.conf"
  echo ""
  echo "Some laptop before RTX can need these options : "
  echo ""
  echo "echo -e 'options nvidia NVreg_UsePageAttributeTable=1 NVreg_InitializeSystemMemoryAllocations=0 NVreg_DynamicPowerManagement=0x02' | sudo tee -a /etc/modprobe.d/nvidia-options.conf"
  echo "--------------------------------------------------------------------------------------------------------------"

  xdg-desktop-menu forceupdate
  update-initramfs -u -k all
}

post_install() {
  #!/bin/sh
  set -e

  DKMS_NAME=nvidia
  DKMS_VERSION=550.90.07

  dkms add -m ${DKMS_NAME} -v ${DKMS_VERSION}
  dkms build -m ${DKMS_NAME} -v ${DKMS_VERSION} && dkms install -m ${DKMS_NAME} -v ${DKMS_VERSION} --force || true

  post_upgrade

}

post_remove() {
  update-initramfs -u -k all
  #if [[ -f /etc/modprobe.d/nvidia-drm.conf ]] ; then
  #  rm /etc/modprobe.d/nvidia-drm.conf
  #fi
}

pre_remove() {
  #!/bin/sh
  set -e

  SRC_DKMS_NAME="nvidia"
  SRC_INSTALLED=$(ls /usr/src/ | grep $SRC_DKMS_NAME)
  DKMS_NAME=$(echo $SRC_INSTALLED | cut -d "-" -f1)
  DKMS_VERSION=$(echo $SRC_INSTALLED | cut -d "-" -f2)

  dkms remove -m $DKMS_NAME -v $DKMS_VERSION --all || true
}
