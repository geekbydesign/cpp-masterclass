# Variable Templates

C++14 introduced **variable templates**, allowing variables themselves to be parameterized by templates.

## Basic Example

```cpp
template <typename T>
constexpr T pi = T(3.1415926535897932385);
```

Now:

```cpp
auto x = pi<float>;
auto y = pi<double>;
```

Each specialization has the appropriate type.

## Another Example

```cpp
template <typename T>
constexpr T zero = T{0};
```

Usage:

```cpp
int a = zero<int>;
double b = zero<double>;
```

## Why Variable Templates?

Before C++14, similar functionality was often expressed using static members of class templates:

```cpp
template <typename T>
struct Constants
{
    static constexpr T zero = T{0};
};
```

Then:

```cpp
Constants<int>::zero;
```

Variable templates provide a more direct syntax:

```cpp
zero<int>;
```

## Type Traits Example

Variable templates became useful for simplifying trait-like expressions:

```cpp
template <typename T>
constexpr bool is_pointer_v = std::is_pointer<T>::value;
```

Usage:

```cpp
is_pointer_v<int*>
```

The standard library later adopted the `_v` convention for many type traits in C++17:

```cpp
std::is_pointer_v<int*>
```

## Specialization

Variable templates can be specialized:

```cpp
template <typename T>
constexpr int value = 0;

template <>
constexpr int value<int> = 42;
```

## `constexpr` Is Common

Variable templates are often used with `constexpr`:

```cpp
template <typename T>
constexpr bool is_signed_v = std::is_signed<T>::value;
```

## Key Point

```text
Function template → parameterized function
Class template   → parameterized type
Variable template → parameterized variable
```

## Interview Point

Variable templates were introduced in C++14 and are commonly encountered in modern C++ through `_v` type-trait helpers.
