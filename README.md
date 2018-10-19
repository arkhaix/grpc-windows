# grpc-windows
Build gRPC on Windows with Visual Studio 2017

# gRPC
[gRPC - An RPC library and framework](http://github.com/grpc/grpc)

# Version
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
