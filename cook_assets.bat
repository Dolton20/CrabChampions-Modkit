SET "ddp=%~dp0" 
SET "ddp=%ddp:~0,-1%" 
 
SET /p editorPath= < Tools\user_settings\editor_directory.txt 
 
del /S CrabChampions\*.uasset 
del /S CrabChampions\*.ubulk 
del /S CrabChampions\*.uexp 
del /S CrabChampions\*.umap 
del /S CrabChampions\*.ufont 
 
"%editorPath%\UE4Editor-Cmd.exe" "%ddp%\UE4Project\CrabChampions.uproject" -run=cook -targetplatform=WindowsNoEditor 
 
robocopy /job:Tools\configs\copy_cooked_assets 
 
robocopy /S Precooked CrabChampions 
