# grpc-windows
Build gRPC on Windows with Visual Studio 2017

# gRPC Version
[gRPC - An RPC library and framework](http://github.com/grpc/grpc)

This repo currently builds *_gRPC v1.15.x._*
If you need a newer version, [BUILDING.md](https://github.com/grpc/grpc/blob/master/BUILDING.md) contains up-to-date instructions for building manually, which you should be able to adapt for this repo.

# Requirements
Visual Studio 2017

[Git](https://git-scm.com)

[CMake](https://cmake.org/)

[Chocolatey](https://chocolatey.org/)

# Build gRPC
From an administrator command prompt:
```
prereqs.bat
```

From any command prompt:
```
clone.bat
build.bat
```

# Export gRPC and protobuf
From any command prompt:
```
export.bat
```
The _export_ folder will contain lib, bin, and include for gRPC and protobuf.

# Build helloworld example
Build gRPC first, then:
```
grpc_helloworld\build.bat
```

# Run helloworld example
Build helloworld first, then:
```
grpc_helloworld\run_helloworld.bat
```

# Platform and configuration
This repo defaults to 64-bit Release builds.

If you have run build.bat already and want to change the platform, then you will need to delete the following files and folders first:
```
grpc\.build\CMakeCache.txt
grpc\.build\CMakeFiles
grpc_helloworld\.build\CMakeCache.txt
grpc_helloworld\.build\CMakeFiles
```

## Build 32-bit
In build.bat and grpc_helloworld\build.bat, change:
```
cmake .. -G "Visual Studio 15 2017 Win64"
```
to
```
cmake .. -G "Visual Studio 15 2017"
```

## Build debug
In build.bat and grpc_helloworld\build.bat, change:
```
cmake --build . --config Release
```
to
```
cmake --build . --config Debug
```