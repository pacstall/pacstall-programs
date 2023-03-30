name="thorium-deb"
if [[ ${CARCH} == "arm64" ]]; then
  gives="thorium-browser-unstable"
  version="110.0.5481.178"
  url="https://github.com/Alex313031/Thorium-Special/releases/download/M${version}_1/thorium-browser_${version}_${CARCH}.deb"
  hash="a429dbb25b30a79674bf4501a541cef6f96b1b5c7c928204535ff726ec56e699"
  arch=("arm64")
else
  version="110.0.5481.178"
  url="https://github.com/Alex313031/Thorium/releases/download/M${version}/thorium-browser_${version}_${CARCH}.deb"
  hash="364492a23ca0bdd6bc2d7ad6d76d9851c4500316d311ada3c22199de1437adb7"
  arch=('amd64');
fi
maintainer="oklopfer <oren@taumoda.com>"
description="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
