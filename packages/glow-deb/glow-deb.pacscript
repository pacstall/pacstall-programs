name="glow-deb"
gives="glow"
replaces=("${gives}")
pkgver="1.5.1"
arch=("amd64" "arm64")
source=("https://github.com/charmbracelet/glow/releases/download/v${pkgver}/glow_${pkgver}_${CARCH}.deb")
hash_amd64=("99e904f9a599f8a007817d49814b2440ff4d95bb5fb9b26763cfc5bf58c579e2")
hash_arm64=("edb4cb7b4f9a531e85be0060109ca7c053d0d02761cc145482f72604f874fed9")
pkgdesc="Render markdown on the CLI, with pizzazz!"
repology=("project: glow")
# vim:set ft=sh ts=2 sw=2 et:
