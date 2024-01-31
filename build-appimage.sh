#!/bin/bash

DIR="$(basename *.tgz .tgz)"
mkdir -p AppDir/
tar -xzvf *.tgz
mv $DIR DAISY
mv DAISY AppDir/

wget -O appimage-builder-x86_64.AppImage https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
chmod +x appimage-builder-x86_64.AppImage

./appimage-builder-x86_64.AppImage
mv daisy-latest-x86_64.AppImage daisy.AppImage