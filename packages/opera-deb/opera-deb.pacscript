#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="opera-deb"
gives="opera-stable"
breaks="opera-beta-deb opera-developer-deb ${gives}-bin ${gives}-app"
replace="${gives}"
version="86.0.4363.23"
url="https://download5.operacdn.com/pub/opera/desktop/${version}/linux/${gives}_${version}_amd64.deb"
description="Opera web browser stable release"
hash="644afcf347896e8f918ec66f7b1f2d78ec1bd1e20337ef6c1fe0be2e52e7f696"
repology=("project: opera")


# vim:set ft=sh ts=2 sw=2 et:
