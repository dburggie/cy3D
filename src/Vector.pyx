from rand import rand
import bounds

class Vector:
    """This handles vector math and manipulation."""
    cdef double x = 0.0
    cdef double y = 0.0
    cdef double z = 0.0
    
    cpdef double dot(self, vector):
        """Calculate dot product of this vector and another."""
        return self.x * vector.x + self.y * vector.y + self.z * vector.z
    
    cpdef double length(self):
        """Calculates vector length."""
        return self.dot(self)# ** 0.5
    
    def __init__(self, double x = 0.0, double y = 1.0, double z = 0.0):
        """Initialize vector with x,y,z coordinates."""
        self.x = x
        self.y = y
        self.z = z
    
    cpdef Vector __sub__(self, vector):
        """Overload '-' operator for vector differences."""
        return Vector(
                self.x - vector.x,
                self.y - vector.y,
                self.z - vector.z
                )
    
    cpdef bool __eq__(self, v):
        """Overload '=' operator for vector equality."""
        # treat the vectors as equal if they are very close together
        if (self - v).length() < bounds.very_small:
            return True
        else:
            return False
    
    cpdef Vector dup(self):
        """Create copy of vector."""
        return Vector(self.x, self.y, self.z)
    
    cpdef Vector copy(self, vector):
        self.x = vector.x
        self.y = vector.y
        self.z = vector.z
        return self
    
    cpdef Vector add(self, vector, double scalar = 1.0):
        """Translate vector by vector addition"""
        self.x += vector.x * scalar
        self.y += vector.y * scalar
        self.z += vector.z * scalar
        return self
    
    cpdef Vector scale(self, double scalar):
        self.x *= scalar
        self.y *= scalar
        self.z *= scalar
        return self
    
    cpdef Vector trans(self, double x, double y, double z):
        """Translate vector by x,y,z offsets."""
        self.x += x
        self.y += y
        self.z += z
        return self
    
    cpdef Vector norm(self):
        """Normalize vector to length 1."""
#        l = (self.x * self.x + self.y * self.y + self.z * self.z ) ** 0.5
        cdef double l
        l = (self.x * self.x + self.y * self.y + self.z * self.z )
        if l <  bounds.very_small:
            return Vector()
        else:
            l = l ** -0.5
            self.x *= l
            self.y *= l
            self.z *= l
            return self
    
    cpdef Vector cross(self, vector):
        """Returns cross product of this vector by another."""
        return Vector(
                self.y * vector.z - self.z * vector.y,
                self.z * vector.x - self.x * vector.z,
                self.x * vector.y - self.y * vector.x
                )
    
    cpdef Vector delta(self, double d):
        """slightly nudges direction of vector."""
        cdef double dx, dy, dz
        dx,dy,dz = 1,1,1
        while dx ** 2 + dy ** 2  + dz ** 2 > 1.0:
            dx = rand(2) - 1.0
            dy = rand(2) - 1.0
            dz = rand(2) - 1.0
        dx *= d
        dy *= d
        dz *= d
        self.trans(dx,dy,dz)
        return self
    
    cpdef p(self):
        return "[{0},{1}.{2}]".format(self.x, self.y, self.z)






