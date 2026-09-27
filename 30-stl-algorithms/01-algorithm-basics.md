# STL Algorithm Basics

The `<algorithm>` library provides generic algorithms that operate on iterator ranges.

```cpp
#include <algorithm>
```

Typical form:

```cpp
std::sort(v.begin(), v.end());
```

## Range Convention

Most algorithms operate on a half-open range:

```text
[first, last)
```

This means:
- `first` points to the first element.
- `last` is one-past-the-end.
- The element at `last` is not included.

Example:

```cpp
std::find(v.begin(), v.end(), 10);
```

## Why Iterators?

Algorithms are separated from containers.

The same algorithm can work with many containers as long as their iterators provide the required operations.

## Common Algorithms

```cpp
std::all_of(...)
std::for_each(...)
std::min_element(...)
std::max_element(...)
std::find(...)
std::copy(...)
std::sort(...)
std::transform(...)
```

## Complexity

Always check the algorithm's required iterator category and complexity.

For example:
- `find` → linear.
- `sort` → `O(n log n)`.
- `min_element` → linear.

## C++20

Many algorithms have range versions:

```cpp
std::ranges::sort(v);
```

This avoids explicitly passing `begin()` and `end()` in many cases.
