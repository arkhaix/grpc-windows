@echo off
@setlocal
pushd "%~dp0"

rem These prereqs come from:
rem     https://github.com/grpc/grpc/blob/master/BUILDING.md

rem In addition to the prereqs in this file, grpc also requires:
rem     Visual Studio 2017
rem     Git
rem     CMake
rem     Chocolatey

rem Install Chocolatey
rem "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem Install prereqs
rem (activeperl hangs for me, but seems to work anyway?)
choco install activeperl
choco install golang
choco install yasm

rem Ninja is optional, not used by these build scripts
rem choco install ninja

popd
endlocal
