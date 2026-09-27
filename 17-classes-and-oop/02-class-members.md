# Class Members

A class can contain different kinds of members.

```cpp
class Example
{
public:
    int data;                 // data member

    void process()            // member function
    {
    }

    static int count;         // static data member

    using ValueType = int;    // type alias
};
```

## Data members

Each ordinary object normally has its own non-static data members.

```cpp
class Point
{
    int x;
    int y;
};
```

Two objects have independent `x` and `y`.

## Member functions

Member functions operate on objects:

```cpp
class Point
{
    int x = 0;

public:
    void setX(int value)
    {
        x = value;
    }
};
```

A non-static member function has access to the current object's members.

## Static members

Static members belong to the class rather than individual objects.

```cpp
class Counter
{
public:
    inline static int count = 0;
};
```

## Nested types

A class can define types inside itself:

```cpp
class Container
{
public:
    using ValueType = int;
};
```

## Access specifiers

```cpp
public:
protected:
private:
```

They determine which code can access members.

## Interview point

Distinguish:

```text
non-static data member → per-object state
static data member     → class-wide state
member function        → behavior associated with the class
```
