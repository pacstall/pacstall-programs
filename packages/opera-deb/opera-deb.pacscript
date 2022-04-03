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
version="85.0.4341.47"
url="https://download5.operacdn.com/pub/opera/desktop/${version}/linux/${gives}_${version}_amd64.deb"
description="Opera web browser stable release"
hash="15a32f10aa05db36b87f4e3a6c28faade767a242d7b7ebee1795ef701dac9dac"
repology=("project: opera")


# vim:set ft=sh ts=2 sw=2 et:
