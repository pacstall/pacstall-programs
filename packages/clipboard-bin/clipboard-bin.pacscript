#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="clipboard-bin"
gives="clipboard"
pkgver="0.10.0"
pkgdesc="Cut, copy, and paste anything in your terminal"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64")
repology=("project: clipboard")
source=("@${pkgname}~${pkgver}::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${gives}-linux-${CARCH}.zip")
sha256sums_amd64=("23a654c05aee16a0945eb933d5466122c38bdbc9aa39f6dd168d25bf51591441")
sha256sums_arm64=("aad8a3057f568afaddb091ffbb8b9d4af95e3d01bb6d182243c3a1d3dec3a60a")
sha256sums_armhf=("9361733715561ed5084c78d147dd1ee7200bd2a6c970ef992187f214d160cf89")
sha256sums_ppc64el=("5392cf06915bb5c6ac45f781e7bf6a7d2878c8ece07bfea7542a2eab9cf03db4")
sha256sums_riscv64=("5253566df73265e11ce24f82892933b998f561b912dcc834f4a10c56c271e042")

package() {
  cd "${pkgname}~${pkgver}"
  if [[ ${CARCH} == "amd64" ]]; then
    install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  fi
  install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}

# vim:set ft=sh ts=2 sw=2 et:
