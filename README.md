# Azahar Artic Setup Tool

## Description
**Azahar Artic Setup Tool** is a 3DS homebrew application that helps installing system files and console unique data to the [Azahar Emulator](https://github.com/azahar-emu/azahar) using your console. It broadcasts the System Settings application as well as the NIM sysmodule to be able to perform a system update and copies your console unique data to enable online functionality.

## Usage instructions
1) Download the `.cia` or `.3dsx` file from the [releases page](https://github.com/azahar-emu/ArticSetupTool/releases) and install it on your real 3DS console.
2) Run the Azahar Artic Setup Tool application. Press A to confirm you want to start it.
3) On the Azahar Emulator, go to `File -> Set Up System Files` and enter the IP address displayed on your console.

NOTE: A recent version of Luma3DS (v13.3.1 or newer) is required to use Azahar Artic Setup Tool. You can get it [here](https://github.com/LumaTeam/Luma3DS/releases/latest).

## Build instructions

You will need:
- libctru 2.7.0+
- [bin2c](https://sourceforge.net/projects/bin2c/files/latest/download) added to your PATH

Then run the following commands in your devkitPro (MSYS2) environment:

```sh
git clone --recurse-submodules https://github.com/azahar-emu/ArticSetupTool.git
cd ArticSetupTool
make
```

Then after a successful build, you will find output files in `app/output/3ds-arm`. These include `AzaharArticSetup.cia` and `AzaharArticSetup.3dsx` among other things.

## License
See [LICENSE](LICENSE)

