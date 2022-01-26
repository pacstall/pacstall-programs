name="android-studio"
version="2021.1.1.20"
url="https://dl.google.com/dl/android/studio/ide-zips/$version/android-studio-$version-linux.tar.gz"
depends="libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386"
description="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development."
hash="2f01b9203241169765b290e84cda5b8b5b6882b8b67ef10e1036e492262fac91"
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"
prepare() {
    true
}
build() {
    #making needed directories
    sudo mkdir -p $STOWDIR/$name/opt/$name
    sudo mkdir -p $STOWDIR/$name/usr/bin
    sudo mkdir -p $STOWDIR/$name/usr/share/applications
    sudo mkdir -p $STOWDIR/$name/usr/share/pixmaps
}
install() {
    # Moving all android studio files to /opt
    sudo cp -a bin lib jre plugins license LICENSE.txt build.txt product-info.json "$STOWDIR/$name/opt/$name"

    # Creating a launcher in $PATH
    sudo ln -s "$STOWDIR/$name/opt/$name/studio.sh" "$STOWDIR/$name/usr/bin/android-studio"

    sudo wget -q https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/android-studio/android-studio.desktop -O "$STOWDIR/$name/usr/share/applications/android-studio.desktop"

    sudo install -Dm644 bin/studio.png "$STOWDIR/$name/usr/share/pixmaps/$name.png"
    sudo chmod -R ugo+rX "$STOWDIR/$name/opt"
}
postinst() {
    sudo update-desktop-database -q
    # Finished installation
    fancy_message info "Finished installation. Please start Android Studio to configure it!"
}
removescript() {
    sudo update-desktop-database -q
}
