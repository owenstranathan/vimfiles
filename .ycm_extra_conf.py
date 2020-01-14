import os
import re
import subprocess
import ycm_core

def LoadSystemIncludes():
    regex = re.compile(ur'(?:\#include \<...\> search starts here\:)(?P<list>.*?)(?:End of search list)', re.DOTALL);
    process = subprocess.Popen(['clang', '-v', '-E', '-x', 'c++', '-'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE);
    process_out, process_err = process.communicate('');
    output = process_out + process_err;
    includes = [];
    for p in re.search(regex, output).group('list').split('\n'):
        p = p.strip();
        if len(p) > 0 and p.find('(framework directory)') < 0:
            includes.append('-isystem');
            includes.append(p);
    return includes;

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]
scriptPath = os.path.dirname(os.path.abspath(__file__));
compilation_database_folder = os.path.join(scriptPath, 'build')
database = None if not os.path.exists(compilation_database_folder) else ycm_core.CompilationDatabase(compilation_database_folder)

# Your custom flags
flags = [
    '-Wall',
    '-Wextra',
    '-std=c++14',
    '-x',
    'c++',
    '-I',
    '.',
]

if sys.platform == "win32":
    # TODO: figure out how to read this from a project level config, I'm sure there is a really easy(existing) way to do this
    sfml_path = 'D:\\libs\\SFML-2.5.1\\include'
    imgui_sfml_path = 'D:\\libs\\ImGui-SFML\\include'
    glm_path = 'D:\\code\\g-truc\\glm'

    if os.path.exists(sfml_path):
        flags.extend([
            '-I', sfml_path, "-DSFML_STATIC"])
    if os.path.exists(imgui_sfml_path):
        flags.extend(['-I', imgui_sfml_path, "-DSFML_STATIC"])
    if os.path.exists(glm_path):
        flags.extend(['-I', glm_path])


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
