pkgname="input-leap-bin"
gives="input-leap"
pkgver="3.0.3"
pkgdesc="Open-source KVM software"
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")
repology=("project: input-leap")
depends=("libqt6widgets6" "libqt6network6" "qt6-qpa-plugins" "libavahi-compat-libdnssd1")
arch=("any")
sha256sums_jammy=("48516fe7ede3685da5036ae9887f2b37f98e3a8817dde1ed0704eaa844b9a863")
sha256sums_noble=("18f5f791e911bf373b2484757e60d9d38bcd7bbaae6d23bf78541eb22c337c5a")
sha256sums_ubuntu=("b0bd213b45aaf8dd3631dd630334d8c9d7ad973497b50fc496726228d54419e6")
sha256sums_debian=("271a147bd73c3fe590635c3deee3fe424e5f8830ca4a14b7f927dc7c6fd19989")
source_jammy=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-ubuntu-22-04-v${pkgver}.tar.gz")
source_noble=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-ubuntu-24-04-v${pkgver}.tar.gz")
source_ubuntu=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-ubuntu-24-10-v${pkgver}.tar.gz")
source_debian=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-debian-12-v${pkgver}.tar.gz")

package() {
  find . -name '*.tar.gz' -exec tar --strip-components=1 -xf {} \;

  find bin -type f -exec install -vDm755 '{}' "${pkgdir}/usr/{}" \;
  find share -type f -exec install -vDm644 '{}' "${pkgdir}/usr/{}" \;
}
