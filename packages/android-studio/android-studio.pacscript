name="android-studio"
version="2020.3.1.22"
url="https://redirector.gvt1.com/edgedl/android/studio/ide-zips/$version/android-studio-$version-linux.tar.gz"
depends="libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386"
description="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development."
hash="4adb7b9876ed7a59ae12de5cbfe7a402e1c07be915a4a516a32fef1d30b47276"
removescript="yes"
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"

prepare() {
    true
}

build() {
    true
}

install() {
    # Moving all android studio files to /opt
    sudo install -D ./* -t "$STOWDIR/$name/opt/android-studio/"

    sudo cp -r bin "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r jre "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r lib "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r license "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r plugins "$STOWDIR/$name/opt/android-studio/"

    # Creating a launcher in $PATH
    sudo ln -s "$STOWDIR/$name/opt/android-studio/bin/studio.sh" "/usr/bin/android-studio"
}

postinst(){
    # Creating .desktop file
    echo '#!/usr/bin/env xdg-open'                          >  /usr/share/applications/android-studio.desktop
    echo '[Desktop Entry]'                                  >> /usr/share/applications/android-studio.desktop
    echo 'Version=2020.3.1.22'                              >> /usr/share/applications/android-studio.desktop
    echo 'Type=Application'                                 >> /usr/share/applications/android-studio.desktop
    echo 'Terminal=false'                                   >> /usr/share/applications/android-studio.desktop
    echo 'Icon=/opt/android-studio/bin/studio.png'          >> /usr/share/applications/android-studio.desktop
    echo 'Exec=/usr/bin/android-studio'                     >> /usr/share/applications/android-studio.desktop
    echo 'Name=Android Studio'                              >> /usr/share/applications/android-studio.desktop
    
    sudo update-desktop-database -q

    # Finished installation
    fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

removescript(){
    # Removing .desktop file
    sudo rm /usr/share/applications/android-studio.desktop
    sudo update-desktop-database -q

    # Removing launcher
    sudo rm /usr/bin/android-studio
}