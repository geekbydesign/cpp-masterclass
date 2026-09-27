# Inline Functions

`inline` is primarily a language/linkage/ODR feature. It is **not a command that guarantees machine-code inlining**.

```cpp
inline int square(int x)
{
    return x * x;
}
```

## Why `inline` exists

A function defined in a header may be included by multiple translation units.

An inline function can have identical definitions in multiple translation units, subject to the One Definition Rule (ODR).

```cpp
// math.h
inline int square(int x)
{
    return x * x;
}
```

This header can be included by multiple `.cpp` files.

## `inline` does not guarantee optimization

```cpp
inline int add(int a, int b)
{
    return a + b;
}
```

The compiler may inline the call, but it may also generate a normal function call.

Optimization decisions depend on the compiler, optimization level, code structure, and other factors.

## Function defined inside a class

A function defined inside a class definition is implicitly inline:

```cpp
class Math
{
public:
    int square(int x)
    {
        return x * x;
    }
};
```

You do not need to write `inline`.

## Inline variables

C++17 introduced inline variables:

```cpp
inline int globalValue = 10;
```

They can be defined in a header and included by multiple translation units while satisfying the ODR requirements.

Static inline class members are also common:

```cpp
class Config
{
public:
    inline static int value = 10;
};
```

## `static` vs `inline`

These solve different problems:

```cpp
static int value;  // internal linkage at namespace scope

inline int value;  // inline variable / ODR semantics
```

Do not assume `inline` means "faster" or that `static` and `inline` are interchangeable.

## Interview points

- `inline` does not guarantee compiler inlining.
- It permits multiple identical definitions of an inline entity across translation units under ODR rules.
- Functions defined inside a class are implicitly inline.
- C++17 introduced inline variables.
