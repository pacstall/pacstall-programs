name="android-studio"
version="2020.3.1.22"
url="https://redirector.gvt1.com/edgedl/android/studio/ide-zips/$version/android-studio-$version-linux.tar.gz"
depends="openjdk-11-jdk libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386"
description="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development."
hash="4adb7b9876ed7a59ae12de5cbfe7a402e1c07be915a4a516a32fef1d30b47276"
removescript="yes"
maintainer="Fahri Korkmaz <fahri.korkmaz@protonmail.ch>"

prepare() {
    true
}

build() {
    true
}

install() {
    # Moving all android studio files to /opt
    sudo install -D * -t "$STOWDIR/$name/opt/android-studio/"

    sudo cp -r bin "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r jre "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r lib "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r license "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r plugins "$STOWDIR/$name/opt/android-studio/"

    # Creating a launcher in $PATH
    sudo ln -s "$STOWDIR/$name/opt/android-studio/bin/studio.sh" "/usr/bin/android-studio"

    # Copy license
    sudo install -Dm644 LICENSE.txt "$STOWDIR/$name/usr/share/licenses/$name/LICENSE.txt"
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

    # Finished installation
    fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

removescript(){
    # Removing .desktop file
    sudo rm /usr/share/applications/android-studio.desktop

    # Removing launcher
    sudo rm /usr/bin/android-studio
}