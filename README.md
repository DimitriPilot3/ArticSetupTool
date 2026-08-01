# Azahar Artic Setup Tool

## Description
**Azahar Artic Setup Tool** is a 3DS homebrew application that assists with installing system files and console-unique data from your own (actual) console to the [Azahar Emulator](https://github.com/azahar-emu/azahar). It broadcasts the System Settings application as well as the `nim` sysmodule to enable Azahar to perform a system update, and copies your console-unique data to enable online functionality.

## Usage instructions
To use this tool, you need a modded console (of the 2DS/3DS family) and a recent version of [Luma3DS](https://github.com/LumaTeam/Luma3DS/releases/latest) (v13.3.1 or newer).

1) Download the `.cia` **or** `.3dsx` file from the [releases page](https://github.com/azahar-emu/ArticSetupTool/releases) and install it **on your modded console** as follows:
    - If you downloaded `AzaharArticSetup.3dsx`, place this file inside the `3ds` folder (**not** `Nintendo 3DS`) on your SD card. You can run it using the Homebrew Launcher.
    - If you downloaded `AzaharArticSetup.cia`, place this file somewhere on your SD card, then use FBI or GodMode9 on your console to install it to the HOME menu.
2) Run the Azahar Artic Setup Tool application on your console. Press (A) to confirm you want to launch the tool.
3) Open the Azahar Emulator and follow the appropriate step for your operating system below:
    - **Android**: Tap on the ⋯ icon (labelled "Options") then go to `System Files -> Connect to Artic Setup Tool` and enter the IP address displayed on your console.
    - **Windows, Linux, Mac OS**: Go to `File -> Set Up System Files` and enter the IP address displayed on your console.
4) A screen will appear on the emulator telling you to "update your system". Click "OK" to proceed.

## Build instructions

Building this tool from source requires the following dependencies:
- [devkitPro](https://devkitpro.org/wiki/Getting_Started)
- [bin2c](https://sourceforge.net/projects/bin2c/files/)
- [Artic Protocol](https://github.com/azahar-emu/ArticProtocol)

First, run the following commands in your devkitPro (or MSYS2) environment:

```sh
pacman -S 3ds-dev --needed --noconfirm
git clone --recurse-submodules https://github.com/azahar-emu/ArticSetupTool.git
cd ArticSetupTool
```

Then run `make` in the ArticSetupTool directory. On success, output files will be saved to the `app/output/3ds-arm` folder (for `AzaharArticSetup.cia` and `AzaharArticSetup.3dsx`) and the `plugin` folder (for `AzaharArticSetup.3gx`).

NOTE: If you change the plugin code (in `plugin/`) for testing purposes, please be aware that the application, by default, does not overwrite the existing plugin file (at `sd:/3ds/ArticSetupTool/ArticSetupTool.3gx`) if its current version number is the same as the app's. This means that such plugin changes may be ignored. To ignore the version check and have the application always overwrite the existing plugin, run `make VERSION_MAJOR=0` instead of just `make`.

## License
See [LICENSE](LICENSE)

