# Inline Functions

`inline` permits a function with external linkage to have multiple identical definitions across translation units, subject to the One Definition Rule.

```cpp
inline int square(int x)
{
    return x * x;
}
```

A common use is defining small functions in headers.

### Important

`inline` does **not** mean:

> "Force the compiler to replace the function call with the function body."

Inlining is an optimization decision.

Modern compilers can inline functions without the `inline` keyword.

### Header Example

```cpp
// math.h
inline int add(int a, int b)
{
    return a + b;
}
```

**Interview:** `inline` is primarily a linkage/ODR property plus an optimization hint historically; it is not a guarantee of machine-code inlining.
