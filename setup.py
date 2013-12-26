from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules = cythonize(
           "Vector.pyx",                 # our Cython source
           sources=["Vector.cpp"],  # additional source file(s)
           language="c++",             # generate C++ code
      ))
