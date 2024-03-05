#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="reshade-shaders-git"
pkgname="reshade-shaders-git"
pkgdesc="A collection of post-processing shaders written in the ReShade FX shader language, to be used by vkBasalt"
source=("https://github.com/crosire/reshade-shaders.git")
pkgver="0.0.1"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")

package() {
  sudo install -dm 755 "${pkgdir}/opt/reshade/shaders"
  sudo install -Dm 644 Shaders/*.* "${pkgdir}/opt/reshade/shaders/"
  sudo install -dm 755 "${pkgdir}/opt/reshade/textures"
  sudo install -Dm 644 Textures/*.* "${pkgdir}/opt/reshade/textures/"
}

# vim:set ft=sh ts=2 sw=2 et:
