@echo off
@setlocal
pushd "%~dp0"

cd cmake_externalproject\.build\helloworld\Release
start greeter_server.exe
greeter_client.exe

popd
endlocal
