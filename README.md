# Crab Champions Modkit

Modkit to make modding Crab Champions easier

## Prerequisites

These need to be installed in order to use the tools:

- [Python 3.8+](https://www.microsoft.com/en-us/p/python-38/9mssztt1n39l)
- Unreal Engine 4.27

You can download Unreal Engine for free through the Epic Games Store app, Make sure to install the correct version.

## Setup

Configure these files before running the modkit.

| File                    | Description   |
| ----------------------- | ------------- |
| editor_directory.txt    | This contains the path to the folder where the Unreal Editor executables are. |
| package_output.txt      | This contains the path to the .pak file that the package.bat tool creates. |

Setting the package_output path to a file in your `~mods` folder is recommended to make testing the mod easy.
Keep the _P at the end of the .pak file's name, this is required for the game to load the file.

### Unreal Assets

Any 3D model, sound file, texture, and a bunch of other things are *Unreal assets*. These files should be managed using the Unreal editor. You can open the project by opening the `.uproject` file in the `UE4Project` folder using the editor.

Unreal assets need to be *cooked* before being packaged.

#### Cooking

Run the `cook_assets.bat` tool to cook the assets and get them ready for packaging.

You can exclude certain files by editing `Tools/configs/copy_cooked_assets.rcj`.

#### Precooked Files

For Unreal assets that are already cooked, for example modified blueprint .uasset files, you can put them in the `Precooked` folder and they will automatically be added when running the `cook_assets.bat` tool. If you don't have a `Precooked` folder, simply make one in the root folder of the mod kit, next to `UE4Project`, `cook_assets.bat`, `package.bat`, etc.

Note that any cooked assets you put directly in the `CrabChampions` folder will be deleted when running the `cook_assets.bat` tool because it needs to clean up the old assets before copying the new ones into the folder.

### Other Files

Anything that isn't an Unreal asset should be added to the `CrabChampions` folder. This folder is what will be turned into a .pak file.

### Packaging

To test your mod, you can run the `package.bat` tool to create a .pak file. If the tool is configured to place the .pak file in your `~mods` folder, you can start the game as soon as it finishes. If you are using Unreal Assets you have to run cook_assets.bat before `package.bat`.

To package your mod for release, use the `Tools/pack_compressed.bat` tool instead. This tool will create a `compressed_pack.pak` file in your `Tools` folder. This .pak file usually takes slightly longer to create, but the file size should be much smaller. You can rename the .pak file to whatever you want.