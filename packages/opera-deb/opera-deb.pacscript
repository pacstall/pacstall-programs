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
version="85.0.4341.18"
url="https://download5.operacdn.com/pub/opera/desktop/${version}/linux/${gives}_${version}_amd64.deb"
description="Opera web browser stable release"
hash="75748344c9d94c3a7cfa245b5bf13ae175a3d488afe747403b9892869c359739"
repology=("project: opera")


# vim:set ft=sh ts=2 sw=2 et:
