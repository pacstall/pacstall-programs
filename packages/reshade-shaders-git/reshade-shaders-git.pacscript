#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="reshade-shaders-git"
gives="reshade-shaders-git"
pkgdesc="A collection of post-processing shaders written in the ReShade FX shader language, to be used by vkBasalt"
source=("https://github.com/crosire/reshade-shaders.git")
arch=("all")
pkgver="0.0.1"
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")

package() {
  cd "reshade-shaders"
  install -dm 755 "${pkgdir}/opt/reshade/shaders"
  install -Dm 644 Shaders/*.* "${pkgdir}/opt/reshade/shaders/"
  install -dm 755 "${pkgdir}/opt/reshade/textures"
  install -Dm 644 Textures/*.* "${pkgdir}/opt/reshade/textures/"
}

# vim:set ft=sh ts=2 sw=2 et:
