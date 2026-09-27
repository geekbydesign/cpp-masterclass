# `constexpr` Functions

A `constexpr` function can participate in constant evaluation when called with suitable constant expressions.

```cpp
constexpr int square(int x)
{
    return x * x;
}

constexpr int value = square(5);
```

A `constexpr` function can also be called at runtime:

```cpp
int x = 10;
int result = square(x);
```

`constexpr` does not mean "always compile-time".

Since C++14, `constexpr` functions can contain more ordinary control flow than in C++11.

**Interview:** `constexpr` means the function is eligible for compile-time evaluation; the compiler may also generate normal runtime code.
