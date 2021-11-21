'''interpreter'''
def interpreter(env_name):
    prefix = "@{}//:{}/".format(env_name, env_name)
    native.filegroup(
        name = env_name + "_interpreter",
        srcs = [prefix + "bin/python", prefix + "python.exe"]
    )