# Three-Way Comparison

C++20 introduced the **three-way comparison operator**:

```cpp
<=>
```

It is commonly called the **spaceship operator**.

## Basic Example

```cpp
#include <compare>

auto result = a <=> b;
```

The result represents an ordering relationship.

## Comparison Categories

C++ provides:

```text
std::strong_ordering
std::weak_ordering
std::partial_ordering
```

Typical meaning:

### Strong Ordering

Values have a consistent equality/order relationship.

```cpp
std::strong_ordering
```

### Weak Ordering

Ordering is meaningful, but equivalence does not necessarily mean identical values.

```cpp
std::weak_ordering
```

### Partial Ordering

Some values may be unordered.

```cpp
std::partial_ordering
```

Floating-point comparisons are a common example where unordered results can occur because of NaN.

## Defaulted Spaceship

```cpp
struct Point
{
    int x;
    int y;

    auto operator<=>(const Point&) const = default;
};
```

The compiler can generate memberwise comparison.

## Equality

C++20 also supports defaulted equality:

```cpp
bool operator==(const Point&) const = default;
```

## Why Useful?

A correctly designed `<=>` can provide ordering support and interact with the relational operators.

## Important

Do not assume `<=>` always returns `bool`.

It returns a comparison category type or another suitable comparison result.

## Interview Point

Know:

```text
<=> → three-way comparison
strong_ordering
weak_ordering
partial_ordering
defaulted comparison
```
