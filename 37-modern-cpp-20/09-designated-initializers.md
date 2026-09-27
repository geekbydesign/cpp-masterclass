# Designated Initializers

C++20 introduced designated initializers for aggregate initialization.

## Basic Example

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

## Declaration Order

Designators must follow the declaration order:

```cpp
struct Point
{
    int x;
    int y;
};

// Correct
Point p{.x = 10, .y = 20};
```

Do not reorder them:

```cpp
// Incorrect
Point p{.y = 20, .x = 10};
```

## Aggregate Types

Designated initialization is intended for aggregates.

```cpp
struct Config
{
    int width;
    int height;
};

Config c{
    .width = 800,
    .height = 600
};
```

## Nested Aggregates

```cpp
struct Point
{
    int x;
    int y;
};

struct Window
{
    Point position;
    int width;
};

Window w{
    .position = {.x = 10, .y = 20},
    .width = 800
};
```

## C++17 Comparison

Before C++20:

```cpp
Point p{10, 20};
```

C++20:

```cpp
Point p{.x = 10, .y = 20};
```

## Important

C++ designated initialization is more restricted than some C-style designated-initializer extensions.

## Interview Point

Designated initializers are a C++20 feature and require an appropriate aggregate type and declaration-order initialization.
