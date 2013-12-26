#ifndef Vector_h
#define Vector_h


class Vector {
public:
    
    // constructor-destructor
    Vector(double X, double Y, double Z);
    ~Vector();
    
    // metrics
    double dot(Vector v);
    double length();
    
    // transformations and useful functions
    Vector dup();
    Vector copy(Vector v);
    Vector cross(Vector v);
    Vector norm();
    Vector add(Vector v, double scalar);
    Vector trans(double dx, double dy, double dz);
    Vector scale(double scalar);
    Vector delta(double delta);
    
    // operators
    Vector operator-(Vector v);
    Vector operator=(Vector v);
    
};

#endif
