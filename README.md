Modern CMake Workshop example project
=====================================

An example C++ project for the Modern CMake workshop of the [C++ Usergroup Zentralschweiz](http://cpp-ug-luzern.blogspot.ch).

## Steps

1. start by adding `validator` to the the projectadd 
2. add the tests for the validator (tests directory + catch)

## Visual Studio

With Visual Studio, you have to tell cmake to create the build directory with all the Visual Studio stuff

```
cmake --build build
```

where the second `build` is the name of the build directory.
