SET /p packageOutput= < Tools\user_settings\package_output.txt 
python Tools\py\u4pak.py pack "%packageOutput%" CrabChampions -p 
