@echo off
pushd "%~dp0"

echo #### grpc clone start!

echo #### git clone

@rem Use this for latest release
@rem powershell git clone --recursive -b ((New-Object System.Net.WebClient).DownloadString(\"https://grpc.io/release\").Trim()) https://github.com/grpc/grpc

@rem This is the current latest and is known to be working
call git clone --recursive -b v1.15.x https://github.com/grpc/grpc

cd grpc
call git submodule update --init
cd ..

echo #### grpc clone done!

popd
