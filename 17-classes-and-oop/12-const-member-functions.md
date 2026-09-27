# Const Member Functions

A const member function is declared with `const` after its parameter list.

```cpp
class Point
{
public:
    int getX() const
    {
        return x;
    }

private:
    int x = 0;
};
```

## Meaning

Inside a const member function, the current object is treated as const.

Conceptually:

```cpp
this
```

acts like a pointer to const object.

## What cannot be modified

```cpp
int getX() const
{
    // x = 10; // Error
    return x;
}
```

Non-mutable data members cannot be modified.

## Const object requirement

```cpp
const Point p;

p.getX(); // OK
```

Without the `const` qualifier on `getX`, this call would not be allowed.

## Overloading

A member function can be overloaded based on constness:

```cpp
class Data
{
public:
    int& value();
    const int& value() const;

private:
    int value_ = 0;
};
```

A non-const object can call the non-const overload; a const object calls the const overload.

## `mutable`

A mutable member can be changed inside a const member function:

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

The `const` after a member function's parameter list qualifies the implicit object parameter, not the function's return value.
