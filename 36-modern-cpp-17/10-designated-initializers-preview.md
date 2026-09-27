# Designated Initializers — C++20 Preview

> **Important:** Designated initializers are a **C++20 feature**, not a C++17 feature. This file is included here as a preview of a feature that follows C++17.

Designated initialization allows aggregate members to be initialized by member name.

## C++20 Example

```cpp
struct Point
{
    int x;
    int y;
};

Point p{
    .x = 10,
    .y = 20
};
```

The member names make the initialization intent explicit.

## Order Requirement

C++20 designated initializers must follow the declaration order of the members.

```cpp
struct Point
{
    int x;
    int y;
};

Point p{
    .x = 10,
    .y = 20
};
```

This is valid.

Do not treat C++ designated initialization as allowing arbitrary member ordering like some other languages.

## Aggregate Requirement

The type must be an aggregate suitable for designated initialization.

## Nested Aggregates

```cpp
struct Point
{
    int x;
    int y;
};

struct Shape
{
    Point center;
    int radius;
};

Shape s{
    .center = {.x = 10, .y = 20},
    .radius = 5
};
```

## C++17 Alternative

In C++17, use ordinary aggregate initialization:

```cpp
Point p{10, 20};
```

## C++17 vs C++20

```text
C++17:
Point p{10, 20};

C++20:
Point p{
    .x = 10,
    .y = 20
};
```

## Interview Point

Designated initializers are useful for readability but remember:

**They are C++20, not C++17.**
