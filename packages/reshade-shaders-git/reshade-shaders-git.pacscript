#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="reshade-shaders-git"
pkgname="reshade-shaders-git"
description="A collection of post-processing shaders written in the ReShade FX shader language, to be used by vkBasalt"
url="https://github.com/crosire/reshade-shaders.git"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b slim . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo install -dm 755 "${pkgdir}/opt/reshade/shaders"
  sudo install -Dm 644 Shaders/*.* "${pkgdir}/opt/reshade/shaders/"
  sudo install -dm 755 "${pkgdir}/opt/reshade/textures"
  sudo install -Dm 644 Textures/*.* "${pkgdir}/opt/reshade/textures/"
}

# vim:set ft=sh ts=2 sw=2 et:
