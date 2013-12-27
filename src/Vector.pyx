cdef extern from "Vector.h" namespace 'cy3D':
    cdef cppclass Vector:
        Vector(double, double, double) except +
        double dot(Vector)
        double length()
        
        Vector dup()
        Vector copy(Vector)
        Vector cross(Vector)
        Vector norm()
        Vector add(Vector v, double scalar)
        Vector trans(double, double, double)
        Vector scale(double)
        Vector delta(double)
        
        Vector operator-(Vector v)
        Vector operator=(Vector v)
