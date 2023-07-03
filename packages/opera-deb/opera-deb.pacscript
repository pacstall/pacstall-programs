#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="opera-deb"
gives="opera-stable"
replace=("${gives}")
version="100.0.4815.30"
url="https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${version}_amd64.deb"
description="Multi-platform web browser developed by its namesake company Opera"
hash="ec958de9202a92b41e600154f48020cabe248d2ec5913a57faa9e7eb09df73b4"
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:
