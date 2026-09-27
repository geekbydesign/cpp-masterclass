# `constinit`

`constinit` was introduced in C++20 to enforce **static initialization** for variables with static or thread storage duration.

## Example

```cpp
constinit int value = 42;
```

The initializer must perform static initialization.

## Why?

It helps detect initialization that would otherwise require dynamic initialization.

This is useful for avoiding the **static initialization order fiasco** and for making initialization guarantees explicit.

## Important Distinction

`constinit` does **not** mean the variable is constant.

```cpp
constinit int value = 42;

value = 100; // allowed
```

Compare:

```cpp
const int value = 42;
// value = 100; // ERROR
```

## `constinit` vs `constexpr`

```text
constexpr
→ constant expression / const object semantics

constinit
→ guarantees static initialization
```

A `constinit` variable need not be `const`.

## Example

```cpp
constinit int counter = 0;

void increment()
{
    ++counter;
}
```

The variable can still be modified.

## Important

`constinit` applies to variables with static or thread storage duration, not ordinary automatic local variables.

## Interview Point

Remember:

```text
const       → cannot modify through the object
constexpr   → compile-time constant expression capability
consteval   → immediate function
constinit   → enforce static initialization
```
