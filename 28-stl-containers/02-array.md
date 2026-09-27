# `std::array`

`std::array` is a fixed-size container wrapping a built-in array.

```cpp
std::array<int, 4> a{1, 2, 3, 4};
```

## Key Properties
- Fixed size known at compile time.
- Contiguous memory.
- No dynamic allocation for the elements themselves.
- Random access: `O(1)`.
- Supports STL iterators and algorithms.

## Common Operations

```cpp
a.size();
a.empty();
a.front();
a.back();
a[0];
a.at(0);
a.fill(0);
```

## `std::array` vs C Array

```cpp
int a[4];
std::array<int, 4> b;
```

`std::array` provides:
- `.size()`
- iterators
- STL compatibility
- safer/value-semantic container behavior.

## Important

The size is part of the type:

```cpp
std::array<int, 3>
std::array<int, 4>
```

are different types.

## Use When

The number of elements is fixed and known at compile time.
