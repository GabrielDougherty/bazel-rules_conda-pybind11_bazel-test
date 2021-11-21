'''interpreter'''
def interpreter(env_name):
    prefix = "@{}//:{}/".format(env_name, env_name)
    native.filegroup(
        name = env_name + "_interpreter",
        # srcs = native.glob([prefix + "bin/python", prefix + "python.exe"])
        srcs = [prefix + "bin/python", prefix + "python.exe"]
    )