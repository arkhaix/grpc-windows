@echo off
@setlocal
pushd "%~dp0"

rem Copy boringssl from the grpc build
rmdir /q /s boringssl
mkdir boringssl
robocopy ../grpc/third_party/boringssl/include ./boringssl /e
robocopy ../grpc/.build/third_party/boringssl/crypto/Release ./boringssl/lib crypto.lib
robocopy ../grpc/.build/third_party/boringssl/ssl/Release ./boringssl/lib ssl.lib

cd cmake_externalproject
mkdir .build
cd .build
cmake .. -G "Visual Studio 15 2017 Win64"
cmake --build . --config Release

rem Copy zlib from the grpc build
robocopy ../../../grpc/.build/third_party/zlib/Release ./helloworld/Release zlib.dll

rem If successful, built executables can be found in cmake_externalproject\.build\helloworld\Release
dir .\helloworld\Release

popd
endlocal