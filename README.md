# Modern CMake Workshop example project

An example C++ project for the Modern CMake workshop of the [C++ Usergroup Zentralschweiz](http://cpp-ug-luzern.blogspot.ch).


## Notes

- [CMake Project Commands](https://cmake.org/cmake/help/v3.11/manual/cmake-commands.7.html#project-commands)
- C++Now 2017, Daniel Pfeifer [Effective CMake](https://www.youtube.com/watch?v=bsXLMQ6WgIk)
- CppCon 2017, Mathieu Ropert [Using Modern CMake Patterns to Enforce a Good Modular Design](https://www.youtube.com/watch?v=eC9-iRN2b04)
- Stephan Kelly, [Embracing Modern CMake](https://steveire.wordpress.com/2017/11/05/embracing-modern-cmake/)

## Steps

1. start by adding `validator` to the the projectadd 
2. add the tests for the validator (tests directory + catch)
3. get the decoder to compile

## Visual Studio

With Visual Studio, you have to tell cmake to create the build directory with all the Visual Studio stuff

```
cmake --build build
```

where the second `build` is the name of the build directory.
