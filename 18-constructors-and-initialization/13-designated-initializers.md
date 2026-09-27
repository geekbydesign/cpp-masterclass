# Designated Initializers

C++20 supports designated initialization for aggregates.

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

## Requirements

Designated initialization works with aggregates.

The designators must follow declaration order:

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

This is not allowed:

```cpp
Point p{
    .y = 20,
    .x = 10
};
```

## Nested Example

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

## C++ Version

Designated initializers are a **C++20** feature.

They are more restricted than C designated initializers; C++ does not support arbitrary out-of-order designators.

## Interview Tip

Remember:

```text
C++20 + aggregate + declaration-order designators
```
