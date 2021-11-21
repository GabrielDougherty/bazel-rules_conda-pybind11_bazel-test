# Test code

Copy of https://github.com/spietras/rules_conda/tree/269657d4a94e8804009224bb4785d6364193a7ad/example

modified for this issue: https://github.com/spietras/rules_conda/issues/31

Build with:

```
bazel build app:number_py_ext.so
```


-----------

original readme:

# rules_conda example

Simple Python app demonstrating usage of `rules_conda`

## Requirements

Linux:

- [`glibc`](https://stackoverflow.com/a/47191900/12861599)
- [any `python`](https://github.com/bazelbuild/bazel/issues/544#issuecomment-495307020)
- [any C compiler (like `gcc`)](https://github.com/bazelbuild/bazel/issues/8751)

Windows:

- not sure

## Usage

Linux:

```sh
./bazelw run app
```

Windows:

```cmd
bazelw run app
```
