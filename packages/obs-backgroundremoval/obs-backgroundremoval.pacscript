name="obs-backgroundremoval"
version="0.3.0"
url="https://codeload.github.com/royshil/obs-backgroundremoval/tar.gz/refs/tags/v${version}-beta"
build_depends="libobs-dev libopencv-dev wget git build-essential cmake"
depends="language-pack-en"
pacdeps="onnxruntime-1-7-0-bin"
description="This plugin is meant to make it easy to replace the background in portrait images and video. It is using a neural network to predict the mask of the portrait and remove the background pixels. It's easily composable with other OBS plugins to replace the background with e.g. an image or a transparent color."
hash="874e09c03b622054fb8e001873318bf631b4f9767adc383b3327032a92dd496b"
maintainer="Zahrun <Zahrun@github.com>"

prepare() {
	# install required dependency for codename > focal
	codename=$(lsb_release -cs)
	case $codename in
		focal )
		;;
		*)
			sudo apt install libsimde-dev
		;;
	esac
	# fix CMakeLists
	sed -i "s/^version_from_git()/set(VERSION $version)/" CMakeLists.txt
	sed -i "s;LIBDIR}/obs-plugin;LIBDIR}/x86_64-linux-gnu/obs-plugin;" CMakeLists.txt
	# fix plugin crashes OBS
	sed -i "s/std::string(newModel);/newModel;/" src/background-filter.cpp
}

build() {
	mkdir build && cd build
	cmake -j$(nproc) -DobsIncludePath=/usr/include/obs -DCMAKE_INSTALL_PREFIX:PATH=$STOWDIR/$name/usr .. > /dev/null && cmake --build . -j$(nproc) > /dev/null
}

install() {
	sudo cmake --install . > /dev/null
	#cd $STOWDIR/$name/usr/lib
	#sudo mkdir x86_64-linux-gnu
	#sudo mv obs* ./x86_64-linux-gnu
	#cd -
	sudo install -Dm644 "../LICENSE" -t "$STOWDIR/$name/usr/share/licenses/$name"
}
