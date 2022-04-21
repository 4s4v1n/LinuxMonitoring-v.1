# LinuxMonitoring-v.1

![monitoring](./images/monitoring.png)
In this project, simple bash scripts are implemented, ranging from displaying messages to the terminal, ending with content analytics in the directory.

## Content
The project contains 5 main scripts decomposed into several files. Each script is stored in the ./src/0x directory, where x is the script number. Each script is run via `./main.sh` , the permissions to run the file as executable are already set.

### Script `01`
This script, when run, expects to receive 1 command line parameter, namely a string or a character. In the case of passing an integer argument or no argument, in principle, an error message will be displayed.
In the case of a valid parameter, this parameter will be displayed.

### Script `02`
This script prints simple information about the system to the console in the format:
 1) TIMEZONE=...
 2) USER=...
 3)OS=...
 4) DATE=...
 5) UPTIME=...
 6) UPTIME_SEC=...
 7)IP=...
 8) MASK=...
 9) GATEWAY = ...
 10) RAM_TOTAL=...
 11) RAM_USED = ...
 12) RAM_FREE=...
 13) SPACE_ROOT=...
 14) SPACE_ROOT_USED=...
 15) SPACE_ROOT_FREE=...
After the output, you will be prompted to save the output information to a file in the format day_month_year_hour_minute_secod.status.

### Script `03`
This script repeats the behavior of the `02` script, but now it takes 4 command line arguments that are responsible for the colors of the displayed information.

    1st argument - background color before `=` character,
    2nd argument - text color before `=` character,
    3rd argument - background color after `=` symbol,
    4th argument is the color of the text after the `=` character.
The argument values ​​range from 1 to 6 inclusive, and represent colors.

    1 - white
    2 - red
    3 - green
    4 - blue
    5 - purple
    6 - black
In case of incorrect parameter values ​​- error message.

### Script `04`
This script repeats the behavior of script `03`, but now it takes the values ​​for colors from the `colors.conf` file, in case of incorrect values ​​already in the file itself, the color values ​​from the `default_colors.conf` file will be selected.

### Script `05`
This parses and displays information about a directory. It is launched with 1 parameter - the path to the directory being analyzed (the path can be relative or absolute, but must necessarily end with `/` characters).
Output information in the format:
 1) Number of subdirectories including the current one.
 2) Types of files contained and their number (conf, txt, executable, log, tar, symbolic links).
 3) Top 10 files by size in descending order.
 4) Top 10 executable files with their properties in descending order.
 5) Script running time.
 