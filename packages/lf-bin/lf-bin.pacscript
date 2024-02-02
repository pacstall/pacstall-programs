name="lf-bin"
pkgname="lf"
repology=("project: ${pkgname}")
gives="${pkgname}"
pkgver="31"
breaks=("${pkgname}-git")
replace=("${pkgname}")
pkgdesc="Terminal file manager written in Go"
arch=('amd64' 'i386' 'arm64' 'armhf' 'mips' 'mips64el' 'ppc64' 'ppc64el' 's390x')
maintainer="Romario <romariorobby@yahoo.com>"

case "${CARCH}" in
  amd64)
    hash="db529fbc0c9ba66d426d7acde95a3520ff67c02162b115415ec2c288b2867f02" ;;
  i386)
    archname="386"
    hash="9561652ace9d9a493ff53e1ec94339a3e1eb15bc7fb386dfd9ce33735ce638b8" ;;
  arm64)
    hash="d2108d911031764e8eda2174d4ac79d7d50423ed2cab866c2743a15e4e9a4109" ;;
  armhf)
    archname="arm"
    hash="e37df7248df110d4782ff703477be1192313458caaeb0849bc477d8da8b1819b" ;;
  mips)
    hash="74d130045bc919fdc5617b3751ebc7cd1cdfb4d56f6a129cda57ed6287f117f0" ;;
  mips64el)
    archname="mips64le"
    hash="8fe96639c0e5e5485ef00525b20980be6655ba35df53b26d87f474a2e91f9d44" ;;
  ppc64)
    hash="6b8d133d48a003ced8879cf07dd1306e195f79dcbe8c05df88dc61af5f9fb648" ;;
  ppc64el)
    archname="ppc64le"
    hash="37f22c711bf5f0a0f03e7de7810b96cba187ab8f573a8cc029d8d835d3666b8f" ;;
  s390x)
    hash="c1f5c9589a74c105cc25c4b870a93de0692d94e91044a7e04a52a91da00ca3ef" ;;
  *) ;;
esac

url="https://github.com/gokcehan/${pkgname}/releases/download/r${pkgver}/${pkgname}-linux-${archname:-${CARCH}}.tar.gz"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
