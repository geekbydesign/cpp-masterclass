# Three-Way Comparison

C++20 introduced the three-way comparison operator:

```cpp
<=>
```

It is commonly called the **spaceship operator**.

Instead of separately asking:

```cpp
a < b
a == b
a > b
```

a three-way comparison determines the ordering relationship in one operation.

## Example

```cpp
#include <compare>

int result = 10 <=> 20;
```

The result is a comparison category rather than a simple `bool`.

## User-Defined Type

```cpp
#include <compare>

struct Point
{
    int x{};
    int y{};

    auto operator<=>(const Point&) const = default;
};
```

This can provide ordering support based on the members.

## Conceptual Result

The result can represent:

```text
less
equal
greater
unordered
```

The exact available states depend on the comparison category.

## Benefits

A single `operator<=>` can support relational operations such as:

```cpp
<
<=
>
>=
```

and, when appropriate, work together with equality comparison.

## Important

`<=>` does not simply return `bool`.

Typical return types include:

```cpp
std::strong_ordering
std::weak_ordering
std::partial_ordering
```

## Interview Tip

Think:

```text
traditional comparisons -> multiple bool-producing operators
<=>                    -> one ordering result
```
