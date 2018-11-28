@echo off
@setlocal
pushd "%~dp0"

rem Copy boringssl from the grpc build
rmdir /q /s boringssl
mkdir boringssl
robocopy /nfl /ndl /njh /njs ../grpc/third_party/boringssl/include ./boringssl /e
robocopy /nfl /ndl /njh /njs ../grpc/.build/third_party/boringssl/crypto/Release ./boringssl/lib crypto.lib
robocopy /nfl /ndl /njh /njs ../grpc/.build/third_party/boringssl/ssl/Release ./boringssl/lib ssl.lib

cd cmake_externalproject
mkdir .build
cd .build
cmake .. -G "Visual Studio 15 2017 Win64"
cmake --build . --config Release

rem Copy zlib from the grpc build
robocopy /nfl /ndl /njh /njs ../../../grpc/.build/third_party/zlib/Release ./helloworld/Release zlib.dll

rem Copy binaries to bin
robocopy /nfl /ndl /njh /njs ./helloworld/Release ../../bin *

popd
endlocal