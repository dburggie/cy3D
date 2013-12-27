#include <cmath>

using namespace cy3D;

class Vector
{
private:
    double x, y, z;

public:
    Vector(double X, double Y, double Z);
    ~Vector();
    
    double dot(Vector v);
    double length();
    
    Vector dup();
    Vector copy(Vector v);
    Vector cross(Vector v);
    Vector norm();
    Vector add(Vector v, double scalar);
    Vector trans(double dx, double dy, double dz);
    Vector scale(double scalar);
    Vector delta(double delta);
    
    Vector operator-(Vector v);
    Vector operator=(Vector v);
};

Vector::Vector(double X, double Y, double Z)
{
    x = X;
    y = Y;
    z = Z;
}

Vector::~Vector() 
{
}


double Vector::dot(Vector v)
{
    return (x * v.x + y * v.y + z * v.z);
}

double Vector::length()
{
    return std::sqrt(x * x + y * y + z * z);
}

// transformations and useful functions
Vector Vector::dup()
{
    return new Vector(x, y, z);
}

Vector Vector::copy(Vector v)
{
    x = v.x;
    y = v.y;
    z = v.z;
    return *this;
}

Vector Vector::cross(Vector v)
{
    return new Vector(
        y * v.z + z * v.y,
        z * v.x + x * v.z,
        x * v.y + y * v.x
        );
}


Vector Vector::norm()
{
    double l = length();
    x /= l;
    y /= l;
    z /= l;
    return *this;
}

Vector Vector::add(Vector v, double scalar)
{
    x += v.x * scalar;
    y += v.y * scalar;
    z += v.z * scalar;
    return *this;
}

Vector Vector::trans(double dx, double dy, double dz)
{
    x += dx;
    y += dy;
    z += dz;
    return *this;
}

Vector Vector::scale(double scalar)
{
    x *= scalar;
    y *= scalar;
    z *= scalar;
    return *this;
}

Vector delta(double delta)
{
    return *this;
}

// operators
Vector Vector::operator=(Vector v)
{
    x = v.x;
    y = v.y;
    z = v.z;
    return *this;
}

Vector Vector::operator-(Vector v)
{
    return new Vector(
        x - v.x,
        y - v.y,
        z - v.z
        );
}


