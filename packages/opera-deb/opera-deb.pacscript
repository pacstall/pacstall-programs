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
version="86.0.4363.32"
url="https://download5.operacdn.com/pub/opera/desktop/${version}/linux/${gives}_${version}_amd64.deb"
description="Opera web browser stable release"
hash="41c72e7b62a3f05d2c905574d8d36f21b2ed04c508134590c69dceeabaf038a9"
repology=("project: opera")


# vim:set ft=sh ts=2 sw=2 et:
