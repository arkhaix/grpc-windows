@echo off
@setlocal
pushd "%~dp0"

@rem This batch file generates exports from grpc.
@rem It sets up include, lib, and bin folders for easier integration into other projects.

@rem Set up export directory structure
md export
md export\grpc
md export\grpc\include
md export\grpc\lib
md export\protobuf
md export\protobuf\bin
md export\protobuf\include
md export\protobuf\lib

@rem Copy grpc includes
robocopy grpc\include export\grpc\include /mir

@rem Copy grpc libs
robocopy grpc\.build\Release export\grpc\lib *.lib

@rem Copy grpc executables
robocopy grpc\.build\Release export\grpc\bin *.exe

@rem Copy grpc dependencies
robocopy grpc\.build\third_party\zlib\Release export\grpc\lib zlibstatic.lib
robocopy grpc\.build\third_party\cares\cares\lib\Release export\grpc\lib *.lib
robocopy grpc\.build\third_party\boringssl\crypto\Release export\grpc\lib *.lib
robocopy grpc\.build\third_party\boringssl\ssl\Release export\grpc\lib *.lib

@rem Run protobuf's extract_includes
cd export\protobuf
call ..\..\grpc\.build\third_party\protobuf\extract_includes.bat
cd ..\..

@rem Copy protobuf libs
robocopy grpc\.build\third_party\protobuf\Release export\protobuf\lib *.lib

@rem Copy protobuf executables
robocopy grpc\.build\third_party\protobuf\Release export\protobuf\bin *.exe

popd
endlocal
