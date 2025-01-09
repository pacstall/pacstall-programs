pkgname="mesa-kisak-fresh"
gives="mesa-kisak-fresh"
pkgver="24.3.0"
pkgdesc="Mesa Fresh from Kisak PPA Sources - No opencl"
arch=('amd64')
url='https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa'
source=("https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa/+sourcefiles/mesa/${pkgver}~kisak1~j/mesa_${pkgver}~kisak1~j.tar.xz")
sha256sum=("3cad69b5a773928040a14e9cfadbca9f074660c9201eba7e73b2e6163ae6514e")

depends=(
  "libx11-dev"
  "libxxf86vm-dev"
  "libsensors4-dev"
  "libxfixes-dev"
  "libxext-dev"
  "libva-dev"
  "libvdpau-dev"
  "libvulkan-dev"
  "x11proto-dev"
  "libx11-xcb-dev"
  "libxcb-dri2-0-dev"
  "libxcb-glx0-dev"
  "libxcb-xfixes0-dev"
  "libxcb-dri3-dev"
  "libxcb-present-dev"
  "libxcb-randr0-dev"
  "libxcb-shm0-dev"
  "libxcb-sync-dev"
  "libxrandr-dev"
  "libxshmfence-dev"
  "libzstd-dev"
  "libelf-dev"
  "libunwind-dev"
  "libglvnd-dev"
  "libexpat1-dev"
  "libomxil-bellagio-dev"
  "zlib1g"
  "libglx-dev"
  "libgl-dev"
  "libudev-dev"
  "libxatracker-dev"
  "libwayland-dev"
)

provides=(
  "libxatracker2=${pkgver}"
  "libxatracker-dev=${pkgver}"
  "libd3dadapter9-mesa=${pkgver}"
  "libd3dadapter9-mesa-dev=${pkgver}"
  "libgbm1=${pkgver}"
  "libgbm-dev=${pkgver}"
  "libegl-mesa0=${pkgver}"
  "libegl1-mesa=${pkgver}"
  "libegl1-mesa-dev=${pkgver}"
  "libwayland-egl1-mesa=${pkgver}"
  "libgles2-mesa=${pkgver}"
  "libgles2-mesa-dev=${pkgver}"
  "libglapi-mesa=${pkgver}"
  "libglx-mesa0=${pkgver}"
  "libgl1-mesa-glx=${pkgver}"
  "libgl1-mesa-dri=${pkgver}"
  "libgl1-mesa-dev=${pkgver}"
  "mesa-common-dev=${pkgver}"
  "mesa-libgallium=${pkgver}"
  "libosmesa6=${pkgver}"
  "libosmesa6-dev=${pkgver}"
  "mesa-teflon-delegate=${pkgver}"
  "mesa-va-drivers=${pkgver}"
  "mesa-vdpau-drivers=${pkgver}"
  "mesa-vulkan-drivers=${pkgver}"
  "mesa-opencl-icd=${pkgver}"
  "mesa-drm-shim=${pkgver}"
)

replaces=(
  "libxatracker2"
  "libxatracker-dev"
  "libd3dadapter9-mesa"
  "libd3dadapter9-mesa-dev"
  "libgbm1"
  "libgbm-dev"
  "libegl-mesa0"
  "libegl1-mesa"
  "libegl1-mesa-dev"
  "libwayland-egl1-mesa"
  "libgles2-mesa"
  "libgles2-mesa-dev"
  "libglapi-mesa"
  "libglx-mesa0"
  "libgl1-mesa-glx"
  "libgl1-mesa-dri"
  "libgl1-mesa-dev"
  "mesa-common-dev"
  "mesa-libgallium"
  "libosmesa6"
  "libosmesa6-dev"
  "mesa-teflon-delegate"
  "mesa-va-drivers"
  "mesa-vdpau-drivers"
  "mesa-vulkan-drivers"
  "mesa-opencl-icd"
  "mesa-drm-shim"
)

makedepends=(
  "cmake"
  "pkg-config"
  "flex"
  "bison"
  "python3-mako"
  "python3-ply"
  "python3-setuptools"
  "libx11-dev"
  "libxxf86vm-dev"
  "libsensors4-dev"
  "libxfixes-dev"
  "libxext-dev"
  "libva-dev"
  "libvdpau-dev"
  "libvulkan-dev"
  "x11proto-dev"
  "libx11-xcb-dev"
  "libxcb-dri2-0-dev"
  "libxcb-glx0-dev"
  "libxcb-xfixes0-dev"
  "libxcb-dri3-dev"
  "libxcb-present-dev"
  "libxcb-randr0-dev"
  "libxcb-shm0-dev"
  "libxcb-sync-dev"
  "libxrandr-dev"
  "libxshmfence-dev"
  "libzstd-dev"
  "libelf-dev"
  "libunwind-dev"
  "libglvnd-dev"
  "libexpat1-dev"
  "libomxil-bellagio-dev"
  "zlib1g"
  "libglx-dev"
  "libgl-dev"
  "libudev-dev"
  "libxatracker-dev"
  "libwayland-dev"
  "libwayland-egl-backend-dev"
  "libclc-15-dev"
  "libclc-15"
  "libclang-15-dev"
  "libclang-cpp15-dev"
  "clang-15"
  "valgrind"
  "llvm-15-dev"
  "llvm-15-runtime"
  "libllvmspirvlib-15-dev"
  "spirv-tools"
  "glslang-tools"
)

pacdeps=("libdrm" "meson-git" "directx-headers-git" "rust-bindgen-git" "wayland-protocols-git")
repology=("project: mesa")
maintainer=("xdavius <xdavius@github.com>")
compatible=("debian:bookworm" "ubuntu:jammy")

prepare() {
  cd mesa-j
  cp debian/patches/* ./
  for patch in *.patch; do
    patch -p1 < "${patch}"
  done

  for patch in *.diff; do
    patch -p1 < "${patch}"
  done
}

build() {
  cd mesa-j
  # shellcheck disable=SC2054
  local meson_options=(
    -D android-libbacktrace=disabled
    -D b_ndebug=true
    -D dri3=enabled
    -D egl=enabled
    -D gbm=enabled
    -D gles1=disabled
    -D gles2=enabled
    -D glvnd=enabled
    -D glx=dri
    -D intel-clc=enabled
    -D libunwind=enabled
    -D llvm=enabled
    -D lmsensors=enabled
    -D microsoft-clc=disabled
    -D osmesa=true
    -D platforms=x11,wayland
    -D rust_std=2021
    -D shared-glapi=enabled
    -D valgrind=enabled
    -D video-codecs=all
    -D vulkan-drivers=amd,intel,intel_hasvk,swrast,virtio
    -D vulkan-layers=device-select,intel-nullhw,overlay
    -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,softpipe,llvmpipe,i915,iris,crocus,zink,d3d12
    -D gallium-extra-hud=true
    -D gallium-nine=true
    -D gallium-omx=bellagio
    -D gallium-opencl=disabled # opencl-clover (icd,standalone,disabled)
    -D gallium-rusticl=false   # opencl-rusticl (true,false)
    -D gallium-va=enabled
    -D gallium-vdpau=enabled
    -D gallium-xa=enabled
  )

  # Build only minimal debug info to reduce size
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'

  meson --prefix=/usr "${meson_options[@]}" build
  meson configure --no-pager build # Print config
  meson compile -C build
}

package() {
  cd mesa-j
  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "${pkgdir:?}/usr/bin"

  # Add indirect rendering
  ln -sr "${pkgdir}"/usr/lib/x86_64-linux-gnu/libGLX_{mesa,indirect}.so.0
}
