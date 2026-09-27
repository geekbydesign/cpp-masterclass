# Equality Operators

The equality operators are:

```text
==   !=
```

## `operator==`

A value-type class can define equality based on its members.

```cpp
struct Point
{
    int x{};
    int y{};

    bool operator==(const Point& other) const
    {
        return x == other.x &&
               y == other.y;
    }
};
```

Usage:

```cpp
Point a{1, 2};
Point b{1, 2};

if (a == b)
{
    // equal
}
```

## `operator!=`

Traditionally, it can be implemented separately:

```cpp
bool operator!=(const Point& other) const
{
    return !(*this == other);
}
```

C++20 provides additional language/library support for equality comparisons, and a defaulted `operator==` can often be used.

## Defaulted Equality

```cpp
struct Point
{
    int x{};
    int y{};

    bool operator==(const Point&) const = default;
};
```

The compiler compares the relevant members.

## Important

Equality is not necessarily identity.

Two different objects can compare equal:

```cpp
Point a{1, 2};
Point b{1, 2};
```

## Interview Tip

For value-like classes, defaulted `operator==` is often the simplest correct implementation when memberwise equality matches the intended semantics.
