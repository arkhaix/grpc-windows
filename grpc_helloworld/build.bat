@echo off
@setlocal
pushd "%~dp0"

cd cmake_externalproject
mkdir .build && cd .build
cmake .. -G "Visual Studio 15 2017"
cmake --build . --config Release

popd
endlocal