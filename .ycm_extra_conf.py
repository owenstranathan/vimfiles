import sys
import os

# some default flags
# for more information install clang-3.2-doc package and
# check UsersManual.html
# 14.22.27905
flags = [
'-Wall',
'-Werror',
# std is required
# clang won't know which language to use compiling headers
'-std=c++14',
# '-x' and 'c++' also required
# use 'c' for C projects
'-x', 'c++',
'-target', 'x86_64-pc-windows-msvc14.22.27905',
# include third party libraries
'-isystem',
'/usr/include/python2.7',
]
if sys.platform == "win32":
    sfml_path = 'C:\\Users\\Public\\Libraries\\SFML-2.5.1\\include'
    if os.path.exists(sfml_path):
        flags.extend([
            '-I', sfml_path, "-DSFML_STATIC"])


# youcompleteme is calling this function to get flags
# You can also set database for flags. Check: JSONCompilationDatabase.html in
# clang-3.2-doc package
# def FlagsForFile( filename ):
#   return {
#     'flags': flags,
#     'do_cache': True
#   }

def Settings(**kwargs):
    lang = kwargs["language"]
    ret = { "flags" : flags, "do_cache": True}
    if lang == "cfamily":
        filename = kwargs["filename"]
        if (filename.endswith(".inl")):
            with open(filename, "r") as inf:
                line = open(filename, "r").readline()
                line = line.strip("\n")
                if line.endswith(".hpp") and line.startswith("//"):
                    line = line.strip("//")
                    line = line.replace(" ", "")
                    dirname = os.path.dirname(filename)
                    override_name = os.path.join(dirname, line)
                    if os.path.exists(override_name):
                        ret["override_filename"] = override_name
                    return ret
        else:
            return ret
    else:
        return ret

#  print(Settings(language="cfamily", filename="D:\\code\\wabisoft\\waves\\src\\vector2.inl"))
