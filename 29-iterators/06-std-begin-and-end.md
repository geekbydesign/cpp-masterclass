# `std::begin()` and `std::end()`

`std::begin()` and `std::end()` provide a generic way to obtain the beginning and end of a range.

```cpp
std::vector<int> v{1, 2, 3};

auto first = std::begin(v);
auto last = std::end(v);
```

They also work with built-in arrays:

```cpp
int a[] = {10, 20, 30};

auto first = std::begin(a);
auto last = std::end(a);
```

This avoids array-to-pointer decay when determining the range.

## Const Overloads

```cpp
const std::vector<int> v{1, 2, 3};

auto first = std::cbegin(v);
auto last = std::cend(v);
```

## Reverse Helpers

C++14 provides:

```cpp
std::rbegin(v);
std::rend(v);
```

and corresponding const versions.

## Why Useful?

Generic code can work with containers and built-in arrays through the same interface.
