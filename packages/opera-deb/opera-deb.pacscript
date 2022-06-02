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
version="87.0.4390.45"
url="https://download5.operacdn.com/pub/opera/desktop/${version}/linux/${gives}_${version}_amd64.deb"
description="Opera web browser stable release"
hash="46e17ab5bdb2071a7b1aa02663a22582277f601321d56ae40ab6af4779b3859a"
repology=("project: opera")


# vim:set ft=sh ts=2 sw=2 et:
