# Comparison Operators

Comparison operators produce a result that can be used to determine relationships between values.

Common operators:

```text
==   !=   <   >   <=   >=
```

Example:

```cpp
int a = 10;
int b = 20;

bool x = a < b;
bool y = a == b;
```

## Overloading Comparisons

User-defined types can overload comparison operators.

```cpp
class Point
{
public:
    int x{};
    int y{};

    bool operator==(const Point& other) const
    {
        return x == other.x && y == other.y;
    }
};
```

## Equality vs Ordering

Two broad categories:

```text
equality:
== !=

ordering:
< > <= >=
```

C++20's three-way comparison can simplify implementation of ordering.

## Return Type

Traditional comparison operators normally return:

```cpp
bool
```

For example:

```cpp
bool operator<(const Point& other) const;
```

## Important

Comparison semantics should be logical and consistent.

For an equality relation, if:

```cpp
a == b
```

then the objects should normally represent equivalent values.

## Interview Tip

Know the distinction between:

```text
equality comparison -> ==, !=
ordering comparison -> <, >, <=, >=
three-way comparison -> <=>
```
