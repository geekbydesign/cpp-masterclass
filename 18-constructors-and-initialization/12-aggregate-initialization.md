# Aggregate Initialization

An aggregate is a type that can be initialized directly from its elements using brace initialization.

Example:

```cpp
struct Point
{
    int x;
    int y;
};

Point p{10, 20};
```

## Common Aggregate Types

Typical examples include:

- arrays
- simple structs/classes satisfying aggregate rules
- `std::array`

## No Constructor Required

```cpp
struct Person
{
    std::string name;
    int age;
};

Person p{"Alice", 30};
```

Members are initialized in declaration order.

## Nested Aggregates

```cpp
struct Point
{
    int x;
    int y;
};

struct Rectangle
{
    Point topLeft;
    Point bottomRight;
};

Rectangle r{{0, 10}, {100, 0}};
```

## Important

Adding constructors or certain access-control/features can change whether a class is an aggregate.

The exact aggregate rules have evolved across C++ standards.

## Interview Tip

Aggregate initialization is direct brace initialization of an aggregate's elements, not constructor-based initialization.
