# Const Objects

A const object cannot have its non-mutable state modified after initialization.

```cpp
const int value = 10;
```

For classes:

```cpp
const Point p{10, 20};
```

The object's state is treated as const.

## Calling member functions

A const object can call only member functions that are themselves `const` (apart from special cases such as mutable state).

```cpp
class Point
{
public:
    int getX() const;
    void setX(int value);
};

const Point p{};

p.getX();      // OK
// p.setX(10); // Error
```

## Why?

A const member function promises not to modify the observable non-mutable state of the object.

## Const reference

```cpp
void print(const Point& point)
{
    point.getX();
}
```

A const reference allows reading an object without copying while preserving constness.

## Constructor and const object

A const object must be initialized during construction:

```cpp
const Point p{10, 20};
```

You cannot default-construct an uninitialized const class object and later assign its members normally.

## Mutable exception

A `mutable` member can be modified even through a const object.

```cpp
class Cache
{
    mutable int hits = 0;

public:
    void access() const
    {
        ++hits;
    }
};
```

## Interview point

Const-correctness means preserving the promise that operations performed through a const object do not modify its non-mutable state.
