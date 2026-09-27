# `consteval`

`consteval` was introduced in C++20 for **immediate functions**.

A call to a `consteval` function must produce a constant expression.

## Example

```cpp
consteval int square(int x)
{
    return x * x;
}

constexpr int value = square(5);
```

The call must be evaluated at compile time.

## Compare with `constexpr`

```cpp
constexpr int square(int x)
{
    return x * x;
}
```

A `constexpr` function can be evaluated at compile time when used in a constant-expression context, but it can also be called at runtime.

A `consteval` function requires compile-time evaluation for calls that are potentially evaluated.

## Example

```cpp
int x = 5;

constexpr int a = square(5); // OK
// int b = square(x);        // ERROR
```

## Why Use `consteval`?

Use it when a value must be computed during compilation.

It is useful for enforcing compile-time APIs and catching misuse early.

## Relationship

```text
constexpr
→ can be evaluated at compile time

consteval
→ must be evaluated at compile time
```

## Interview Point

`consteval` is stronger than `constexpr`: it creates an immediate function whose calls require constant evaluation.
