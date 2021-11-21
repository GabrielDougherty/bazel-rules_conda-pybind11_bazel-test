load("@rules_python//python:defs.bzl", "py_binary")
load("@pybind11_bazel//:build_defs.bzl", "pybind_library", "pybind_extension")

alias(
    name = "app",
    actual = "main",
)

cc_library(
    name = "number_cc_lib",
    srcs = glob(["*.h", "*.cpp"])
)

pybind_library(
    name = "number_py_lib",
    deps = [":number_cc_lib"],
)

pybind_extension(
    name = "number_py_ext",
    deps = [":number_py_lib"]
)

py_binary(
    name = "main",
    srcs = glob(["**/*.py"]),
    deps = [":number_py_ext.so"]
)
