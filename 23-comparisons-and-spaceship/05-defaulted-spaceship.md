# Defaulted Spaceship

C++20 allows a class to default its three-way comparison.

```cpp
#include <compare>

struct Point
{
    int x{};
    int y{};

    auto operator<=>(const Point&) const = default;
};
```

The compiler generates the comparison based on the members.

## Member-Wise Comparison

Members are compared in declaration order.

Conceptually:

```text
compare x
    |
    +-- not equivalent -> result
    |
    +-- equivalent
            |
            v
        compare y
```

## Example

```cpp
Point a{1, 2};
Point b{1, 3};

bool result = a < b;
```

The generated ordering can determine the result through the members.

## Equality Interaction

A defaulted `<=>` can work together with an equality operator.

A common pattern is:

```cpp
struct Point
{
    int x{};
    int y{};

    auto operator<=>(const Point&) const = default;
    bool operator==(const Point&) const = default;
};
```

## Return Type

With:

```cpp
auto operator<=>(const Point&) const = default;
```

the compiler determines an appropriate comparison category based on the members.

## When It Can Fail

If a member cannot be compared using the required operation, the defaulted comparison may be deleted or fail to provide the desired semantics.

## Interview Tip

Defaulted `<=>` is especially useful for value types where memberwise ordering matches the intended ordering.
