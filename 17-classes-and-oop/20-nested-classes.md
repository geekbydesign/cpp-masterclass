# Nested Classes

A class can contain another class definition.

```cpp
class Outer
{
public:
    class Inner
    {
    public:
        void process()
        {
        }
    };
};
```

Usage:

```cpp
Outer::Inner object;
```

## Why nested classes?

Nested classes are useful when a helper type is conceptually part of the enclosing class's interface or implementation.

Examples:

- iterator types
- helper types
- state types
- implementation details

## Access

A nested class is a member of the enclosing class and is subject to the enclosing class's access control.

```cpp
class Outer
{
private:
    class Helper
    {
    };
};
```

`Helper` is private.

## Important distinction

A nested class does **not** automatically contain a pointer/reference to an instance of the outer class.

It is not equivalent to an inner class in some other languages.

```cpp
class Outer
{
    int value = 10;

public:
    class Inner
    {
    public:
        void f()
        {
            // Cannot directly access an Outer object's value
            // because there is no implicit Outer object.
        }
    };
};
```

An explicit `Outer` object/reference is needed.

## Static context

Nested classes can contain their own:

- data members
- member functions
- constructors
- static members
- access control

## Interview point

A nested C++ class is a scoped member type, not an automatically object-associated inner object.
