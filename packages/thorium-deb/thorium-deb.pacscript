name="thorium-deb"
gives="thorium-browser"
if [[ ${CARCH} == "arm64" ]]; then
  version="111.0.5563.111"
  url="https://github.com/Alex313031/Thorium-Special/releases/download/M${version}_2/thorium-browser_${version}_${CARCH}.deb"
  hash="bddfcf067ee311bed5356887e8d52968b8b69871ab82d48e7ec9379821075546"
  arch=("arm64")
else
  version="111.0.5563.111"
  url="https://github.com/Alex313031/Thorium/releases/download/M${version}/thorium-browser_${version}_${CARCH}.deb"
  hash="a5c33494ecd28aaf42a593ef5dac2cc2a686057005f633932808dc7dbaefb963"
  arch=('amd64')
fi
maintainer="oklopfer <oren@taumoda.com>"
description="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
