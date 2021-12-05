name="graillon"
_name="Graillon"
version="2.6"
url="https://www.auburnsounds.com/downloads/$_name-FREE-$version.zip"
description="Graillon is a Vocal Live Changer that brings a world of possibilities right into your DAW"
hash="1a94c86c2d0da8a2830a6aa838e7d1f26454149a1a83592d500739bc5198659e"
maintainer="echometer <guacamolek@yandex.com>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo mkdir -p "$STOWDIR/$name/usr/lib/lv2"
  sudo mv "./Linux/Linux-64b-LV2-FREE" "$STOWDIR/$name/usr/lib/lv2/Auburn Sounds $_name 2.lv2"
  sudo mkdir -p "$STOWDIR/$name/usr/lib/vst"
  sudo mv "./Linux/Linux-64b-VST2-FREE" "$STOWDIR/$name/usr/lib/vst/Auburn Sounds $_name 2.VST2"
  sudo mkdir -p "$STOWDIR/$name/usr/lib/vst3"
  sudo mv "./Linux/Linux-64b-VST3-FREE/Auburn Sounds $_name 2.vst3" "$STOWDIR/$name/usr/lib/vst3/Auburn Sounds $_name 2.vst3"
}
