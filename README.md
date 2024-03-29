# daisy-appimage

Script for packaging Daisy (quTAG) into an [AppImage](https://github.com/AppImage), intended for use in an Ubuntu 18.04 LTS container, as this is the latest LTS that supports Qt4 libraries. Uses [appimage-builder](https://github.com/AppImageCrafters/appimage-builder/).

The script downloads the required dependencies, extracts the daisy tarball, and uses the files to produce both the daisy AppImage and a deb file for the required udev rules.

This repo does not provide Daisy itself, just a script to convert a Daisy tarball (.tgz archive file) into an AppImage.

## Usage
Execute this script in an Ubuntu 18.04 LTS system, ideally a container.\
First clone the repo, then download daisy and place the archive into the repo folder. Finally, run the script, which will produce the daisy.AppImage file and a deb file containing the required udev rules.

Install the deb file before running the AppImage to access nhands devices\
`sudo apt install ./daisy-nhands-rules.deb`
