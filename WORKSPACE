load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

### RULES_PYTHON ###
http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.5.0/rules_python-0.5.0.tar.gz",
    sha256 = "cd6730ed53a002c56ce4e2f396ba3b3be262fd7cb68339f0377a45e8227fe332",
)

### RULES_CONDA ###
# use this instead of http_archive if you cloned the repo and want to use the local version
# local_repository(
#    name = "rules_conda",
#    path = "../",
# )

# use this instead of local_repository if you want to use the release version
# keep in mind that there may be differences between them
http_archive(
    name = "rules_conda",
    sha256 = "d1029458859a5335c9e7f7d9cdc4d457d9907b62dcb64a5391674fcd051f09b4",
    strip_prefix = "rules_conda-main",
    url = "https://github.com/spietras/rules_conda/archive/refs/heads/main.zip"
)

load("@rules_conda//:defs.bzl", "conda_create", "load_conda", "register_toolchain")

# download and install conda
load_conda(
    conda_version = "4.10.3",  # optional, defaults to 4.10.3
    install_mamba = False,  # use True to install mamba, which a faster drop-in replacement for conda
    mamba_version = "0.17.0",  # optional, defaults to 0.17.0
    quiet = False,  # use True to hide conda output
)

# create environment with python3
conda_create(
    name = "py3_env",
    timeout = 600,  # each execute action can take up to 600 seconds
    clean = False,  # use True if you want to clean conda cache (less space taken, but slower subsequent builds)
    environment = "@//third_party/conda:py3_environment.yml",  # label pointing to environment.yml file
    quiet = False,  # use True to hide conda output
    use_mamba = False,  # use True to use mamba, which a faster drop-in replacement for conda
)

# register pythons from environment as toolchain
register_toolchain(
    py3_env = "py3_env",
)

http_archive(
  name = "pybind11_bazel",
  strip_prefix = "pybind11_bazel-992381ced716ae12122360b0fbadbc3dda436dbf",
  urls = ["https://github.com/pybind/pybind11_bazel/archive/992381ced716ae12122360b0fbadbc3dda436dbf.zip"],
)
# We still require the pybind library.
http_archive(
  name = "pybind11",
  build_file = "@pybind11_bazel//:pybind11.BUILD",
  strip_prefix = "pybind11-2.8.1",
  urls = ["https://github.com/pybind/pybind11/archive/v2.8.1.tar.gz"],
)
load("@pybind11_bazel//:python_configure.bzl", "python_configure")

load("@//:interpreter.bzl", "python_interpreter")

### this does not work (try #1):

filegroup(
    name = "python_interpreter",
    srcs = (["@py3_env//:py3_env/bin/python","@py3_env//:py3_env/python.exe"])
)

python_configure(
    name = "local_config_python",
    python_interpreter_target = ":python_interpreter",
)

### This does not work (try #2):
python_configure(
    name = "local_config_python",
    python_interpreter_target =  select({
        "@bazel_tools//src/conditions:windows": "@py3_env//:py3_env/python.exe",
        "//conditions:default": "@py3_env//:py3_env/bin/python",
  }),
)

### This works but is not platform-independent:
python_configure(
    name = "local_config_python",
    python_interpreter_target = "@py3_env//:py3_env/bin/python",
)