@echo off
@setlocal
pushd "%~dp0"

cd grpc
md .build & cd .build
cmake .. -G "Visual Studio 15 2017 Win64"
cmake --build . --config Release

@rem Building with Ninja (choco install ninja) is supposedly faster, but I haven't tested it
@rem cd grpc
@rem md .build && cd .build
@rem "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -latest -property installationPath > tmp
@rem SET /P VSCOMNTOOLS= < tmp
@rem del tmp
@rem call "%VSCOMNTOOLS%\VC\Auxiliary\Build\vcvarsall.bat" amd64
@rem cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release
@rem cmake --build .

popd
endlocal