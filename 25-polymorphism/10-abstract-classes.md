# Abstract Classes

An abstract class cannot be instantiated directly.

A class is abstract if it has at least one pure virtual function that is not overridden appropriately in the class.

```cpp
class Shape {
public:
    virtual void draw() = 0;
};

Shape s; // error
```

A concrete derived class implements the required functions:

```cpp
class Circle : public Shape {
public:
    void draw() override {}
};

Circle c; // OK
```

## Abstract Class Can Have
- Data members
- Constructors
- Destructors
- Non-virtual functions
- Virtual functions
- Pure virtual functions

## Purpose
Abstract classes provide a common polymorphic interface while preventing direct creation of incomplete base objects.
