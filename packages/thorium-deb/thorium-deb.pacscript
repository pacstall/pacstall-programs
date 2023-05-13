name="thorium-deb"
gives="thorium-browser"
if [[ ${CARCH} == "arm64" ]]; then
  version="111.0.5563.111"
  url="https://github.com/Alex313031/Thorium-Special/releases/download/M${version}_2/${gives}_${version}-1_${CARCH}.deb"
  hash="bddfcf067ee311bed5356887e8d52968b8b69871ab82d48e7ec9379821075546"
  arch=("arm64")
else
  version="112.0.5615.166"
  url="https://github.com/Alex313031/thorium/releases/download/M${version}/thorium-browser_${version}-1_${CARCH}.deb"
  hash="74ea7802877e5c8375a9386e185e5bbd057adb56fcde09bc472ed90cc3ef57ed"
  arch=('amd64')
fi
maintainer="oklopfer <oren@taumoda.com>"
description="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
