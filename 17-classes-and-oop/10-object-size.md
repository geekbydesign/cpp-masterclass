# Object Size

`sizeof(object)` gives the size of the object's type in bytes.

```cpp
class Point
{
    int x;
    int y;
};

Point p;

std::cout << sizeof(p);
```

The size includes data members plus any required padding/alignment.

## Padding

Compilers may insert padding between members:

```cpp
struct Example
{
    char c;
    int i;
};
```

The size may be greater than:

```text
sizeof(char) + sizeof(int)
```

because `int` may require stricter alignment.

## Empty class

```cpp
class Empty
{
};

std::cout << sizeof(Empty);
```

An object generally has non-zero size so that distinct objects can have distinct addresses.

## Member functions

Ordinary non-static member functions do **not** add one copy of their machine code to every object.

Objects store data members, not a separate copy of the function implementation.

## Static data members

Static data members are not stored separately inside every object.

```cpp
class Counter
{
    int value;
    inline static int count = 0;
};
```

`value` contributes to each object's size; `count` does not.

## Virtual functions

A class with virtual functions may contain implementation-specific hidden data such as a virtual-table pointer, which can affect object size.

The exact layout is implementation-dependent.

## Inspecting layout

Useful tools:

```cpp
sizeof(T)
alignof(T)
```

Debuggers and compiler-specific layout tools can show actual object layout.

## Interview point

Object size depends on:

- non-static data members
- alignment
- padding
- implementation-specific ABI details
- virtual inheritance/polymorphism mechanisms
