# SDLXLIFF Text Extractor

This PowerShell script extracts the source and translated text from SDLXLIFF files in a specified folder and outputs them to separate `.txt` files. Each line in the output file contains a source text and its corresponding translated text, separated by a tab character.

## Prerequisites

- PowerShell

## Usage

1. Create a batch file named `Run.bat` with the following content:

```batch
@echo off
PowerShell.exe -ExecutionPolicy RemoteSigned -File "SDLXLIFF2PlaneText.ps1"
```

2. Save the batch file in the same directory as the PowerShell script (`SDLXLIFF2PlaneText.ps1`).
3. Double-click the `Run.bat` file or run it from the command prompt to execute the PowerShell script.
4. When prompted, enter the path to the directory containing the SDLXLIFF files you want to process:

```
Dir: [FolderPath]
```

Replace `[FolderPath]` with the path to the target directory.

## Example

Suppose the batch file is named `Run.bat`. Double-click the batch file or run it from the command prompt:

```
Run.bat
```

When prompted, enter the path to the directory containing the SDLXLIFF files:

```
Dir: C:\\Users\\Username\\Documents\\SDLXLIFF_Files
```

The script will process all SDLXLIFF files in the specified folder and its subdirectories, and output corresponding `.txt` files with extracted source and translated text in the same location as the input files.

## Script Overview

The script performs the following steps:

1. Prompts the user for the folder path containing the SDLXLIFF files.
2. Recursively processes all files in the specified folder with a `.sdlxliff` extension.
3. Loads the XML data from each SDLXLIFF file and extracts the source and translated text.
4. Outputs the extracted source and translated text to a new `.txt` file, with each line containing a source text and its corresponding translated text separated by a tab character.

## REQUIREMENTS  
- Windows  

## LICENSE  
MIT

## AUTHOR  
Kenta Goto
