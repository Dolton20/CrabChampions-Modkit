# UE4 Modkit

This will create a set of tools to make it easier to work on mods for Unreal Engine Games. The tools will only run on Windows.

## Prerequisites

These need to be installed in order to use the tools:

- [Python 3.8+](https://www.microsoft.com/en-us/p/python-38/9mssztt1n39l)
- Unreal Engine (Use the version the game uses)

You can download Unreal Engine for free through the Epic Games Store app, Make sure to install the version that the game you are modding is using.

## Setup

First run setup.bat, The game name will be the name of the exe (this is case sensitive)

After running setup.bat edit the text files in the `Tools/user_settings` folder to configure the tools:

| File                    | Description   |
| ----------------------- | ------------- |
| editor_directory.txt    | This contains the path to the folder where the Unreal Editor executables are. |
| package_output.txt      | This contains the path to the .pak file that the package.bat tool creates. |

Setting the package_output path to a file in your `~mods` folder is recommended to make testing the mod easy.

### Unreal Assets

Any 3D model, sound file, texture, and a bunch of other things are *Unreal assets*. These files should be managed using the Unreal editor. You can open the project by opening the `.uproject` file in the `UE4Project` folder using the editor.

Unreal assets need to be *cooked* before being packaged.

#### Cooking

Run the `cook_assets.bat` tool to cook the assets and get them ready for packaging

You can exclude certain files by editing `Tools/configs/copy_cooked_assets.rcj`

#### Precooked Files

For Unreal assets that are already cooked, for example modified blueprint .uasset files, you can put them in the `Precooked` folder and they will automatically be added when running the `cook_assets.bat` tool. If you don't have a `Precooked` folder, simply make one in the root folder of the mod kit, next to `UE4Project`, `cook_assets.bat`, `package.bat`, etc.

Note that any cooked assets you put directly in the `INSERT GAME NAME HERE` folder will be deleted when running the `cook_assets.bat` tool because it needs to clean up the old assets before copying the new ones into the folder.

### Other Files

Anything that isn't an Unreal asset should be added to the `INSERT GAME NAME HERE` folder. This folder is what will be turned into a .pak file.

### Packaging

To test your mod, you can run the `package.bat` tool to create a .pak file. If the tool is configured to place the .pak file in your `~mods` folder, you can start the game as soon as it finishes.

To package your mod for release, use the `Tools/pack_compressed.bat` tool instead. This tool will create a `compressed_pack.pak` file in your `Tools` folder. This .pak file usually takes slightly longer to create, but the file size should be much smaller. You can rename the .pak file to whatever you want.