# `if constexpr`

`if constexpr` performs compile-time branch selection. It was introduced in C++17 and is especially useful in templates.

## Basic Example

```cpp
template <typename T>
void process(T value)
{
    if constexpr (std::is_integral_v<T>)
    {
        std::cout << "Integral\n";
    }
    else
    {
        std::cout << "Non-integral\n";
    }
}
```

The condition is evaluated at compile time.

## Normal `if` vs `if constexpr`

Normal:

```cpp
if (condition)
{
}
```

is runtime control flow.

`if constexpr`:

```cpp
if constexpr (condition)
{
}
```

selects a branch during compilation.

## Discarded Statement

The non-selected branch is discarded for the relevant template instantiation.

```cpp
template <typename T>
void print(T value)
{
    if constexpr (std::is_pointer_v<T>)
    {
        std::cout << *value;
    }
    else
    {
        std::cout << value;
    }
}
```

This allows different code to be selected for different types.

## Compile-Time Condition

```cpp
if constexpr (sizeof(T) > 4)
{
}
```

The condition must be usable as a constant expression.

## Typical Template Use

```cpp
#include <type_traits>

template <typename T>
void process(T value)
{
    if constexpr (std::is_floating_point_v<T>)
    {
        std::cout << "Floating point";
    }
    else if constexpr (std::is_integral_v<T>)
    {
        std::cout << "Integer";
    }
    else
    {
        std::cout << "Other";
    }
}
```

## C++ Version

```text
C++17
```

## Quick Revision

```text
if
    → runtime branch

if constexpr
    → compile-time branch selection
    → especially useful in templates
```

## Interview Question

Why use `if constexpr` in templates?

Because the non-selected branch can be discarded during template instantiation, allowing different code paths to be valid for different types.
