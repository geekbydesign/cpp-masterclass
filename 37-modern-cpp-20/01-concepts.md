# Concepts

C++20 introduced **concepts**, a language feature for expressing template requirements directly.

## Basic Concept

```cpp
template <typename T>
concept Integral = std::is_integral_v<T>;

template <Integral T>
T add(T a, T b)
{
    return a + b;
}
```

## Requires Clause

```cpp
template <typename T>
requires std::is_integral_v<T>
T add(T a, T b)
{
    return a + b;
}
```

## Requires Expression

A concept can check whether an expression is valid:

```cpp
template <typename T>
concept Addable = requires(T a, T b)
{
    a + b;
};
```

## Combining Concepts

```cpp
template <typename T>
concept Numeric =
    std::integral<T> || std::floating_point<T>;
```

## Abbreviated Function Template

```cpp
void print(std::integral auto value)
{
    std::cout << value;
}
```

This is equivalent in spirit to constraining a function template.

## Why Concepts?

Compared with older SFINAE-heavy techniques, concepts provide:
- Clearer constraints.
- Better diagnostics.
- More readable interfaces.
- Better overload resolution for constrained templates.

## Important

A concept constrains what types are acceptable. It does not create a new runtime type.

## Interview Point

Know the difference:

```text
concept           → named compile-time constraint
requires clause   → constrains a declaration
requires expression→ tests whether expressions/types satisfy requirements
```
