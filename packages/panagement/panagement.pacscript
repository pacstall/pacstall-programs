name="panagement"
_name="Panagement"
version="2.4"
url="https://www.auburnsounds.com/downloads/$_name-FREE-$version.zip"
description="Panagement is the spatialization laboratory that has found its way to thousands of studios around the world. Panagement gives you raw power over your stereo tracks."
hash="d8544b8941fcc9049b6743c99799b380bd636c6f49b10ed08204719de866f1a1"
maintainer="echometer <guacamolek@yandex.com>"

prepare() {
	true
}

build() {
	true
}

install() {
	mkdir -p "$STOWDIR/$name/usr/lib/lv2"
	mv "./Linux/Linux-64b-LV2-FREE" "$STOWDIR/$name/usr/lib/lv2/Auburn Sounds $_name 2.lv2"
	mkdir -p "$STOWDIR/$name/usr/lib/vst"
	mv "./Linux/Linux-64b-VST2-FREE" "$STOWDIR/$name/usr/lib/vst/Auburn Sounds $_name 2.VST2"
	mkdir -p "$STOWDIR/$name/usr/lib/vst3"
	mv "./Linux/Linux-64b-VST3-FREE/Auburn Sounds $_name 2.vst3" "$STOWDIR/$name/usr/lib/vst3/Auburn Sounds $_name 2.vst3"
}
