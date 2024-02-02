name="davinci-resolve"
pkgver="18.6.4"
pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
homepage='https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion'
arch=('amd64')
makedepends=('fakeroot')
breaks=("${name}-beta" "${name}-studio" "${name}-studio-beta")
url="https://github.com/oklopfer/debs/raw/master/empty.tar.xz"
mrd_ver="1.6.4"
mrd_url="https://www.danieltufvesson.com/download/?file=makeresolvedeb/makeresolvedeb_${mrd_ver}_multi.sh.tar.gz"

product="DaVinci Resolve"
download_id="f38fc270c4c040bea4782182d0fbb367"
siteurl="https://www.blackmagicdesign.com/api/register/us/download/${download_id}"
useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36"
reqjson="{ \
    \"firstname\": \"Arch\", \
    \"lastname\": \"Linux\", \
    \"email\": \"someone@archlinux.org\", \
    \"phone\": \"202-555-0194\", \
    \"country\": \"us\", \
    \"street\": \"Bowery 146\", \
    \"state\": \"New York\", \
    \"city\": \"AUR\", \
    \"product\": \"${product}\" \
}"
reqjson="$(printf '%s' "${reqjson}" | sed 's/[[:space:]]\+/ /g')"

resolve_url="$(curl -s \
  -H 'Host: www.blackmagicdesign.com' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Origin: https://www.blackmagicdesign.com' \
  -H "${useragent}" \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H "Referer: https://www.blackmagicdesign.com/support/download/${download_id}/Linux" \
  -H 'Accept-Encoding: gzip, deflate, br' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Authority: www.blackmagicdesign.com' \
  -H 'Cookie: _ga=GA1.2.1849503966.1518103294; _gid=GA1.2.953840595.1518103294' \
  -d "${reqjson}" \
  --compressed \
  "${siteurl}")"
resolve_hash="4a4aa6c950b37120edaf9e8f21f36737a3d655531da977d55b65b4d0a2d91a5f"

custom_download() {
  curl \
    -o "${name}.zip" \
    --retry 3 --retry-delay 3 \
    -H "Upgrade-Insecure-Requests: 1" \
    -H "${_useragent}" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" \
    -H "Accept-Language: en-US,en;q=0.9" \
    --compressed \
    "${resolve_url}"
}

prepare() {
  curl -sO "${mrd_url}"
  tar xf ./*.tar.gz
  mv ./makeresolvedeb_*.sh makeresolvedeb
  chmod +x makeresolvedeb

  fancy_message info "Downloading DaVinci Resolve"
  custom_download
  fancy_message info "Verifying DaVinci Resolve"
  sha256sum -c <<< "${resolve_hash} ${name}.zip"
  fancy_message info "Unpacking DaVinci Resolve"
  unzip -q "${name}.zip"
  rm "${name}.zip"
}

build() {
  fancy_message info "Making deb"
  ./makeresolvedeb ./*.run
}

package() {
  sudo dpkg -i "${name}.deb"
}

# vim:set ft=sh ts=2 sw=2 et:
