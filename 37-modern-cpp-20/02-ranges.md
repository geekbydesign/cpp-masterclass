# Ranges

C++20 introduced the ranges library, providing range-based algorithms and lazy views.

Header:

```cpp
#include <ranges>
```

## Range Algorithms

Instead of:

```cpp
std::sort(values.begin(), values.end());
```

you can write:

```cpp
std::ranges::sort(values);
```

## Views

Views are lightweight, non-owning and generally lazy.

```cpp
auto result =
    values
    | std::views::filter([](int x) { return x % 2 == 0; })
    | std::views::transform([](int x) { return x * 2; });
```

The operations are not necessarily performed when the view is created.

## Common Views

```cpp
std::views::filter
std::views::transform
std::views::take
std::views::drop
std::views::reverse
std::views::iota
```

## Pipe Operator

```cpp
auto result =
    values
    | std::views::filter(predicate)
    | std::views::transform(function);
```

This allows readable composition.

## Projections

Many ranges algorithms support projections:

```cpp
std::ranges::sort(
    people,
    {},
    &Person::age
);
```

The algorithm compares the projected value rather than requiring a custom comparator for every case.

## Range vs Container

A range is an abstraction representing something that can be iterated.

A container owns its elements; a view generally does not.

## Important

Views can be lazy and may refer to underlying data. Lifetime matters.

## Interview Point

The key C++20 ranges concepts are:

```text
ranges algorithms
views
adaptors
lazy evaluation
projections
range composition
```
