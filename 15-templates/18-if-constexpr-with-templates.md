# `if constexpr` with Templates

`if constexpr` was introduced in C++17 and allows compile-time conditional code.

```cpp
template <typename T>
void process(T value)
{
    if constexpr (std::is_integral_v<T>)
    {
        std::cout << "integer";
    }
    else
    {
        std::cout << "non-integer";
    }
}
```

## Why ordinary `if` is different

A normal `if` still requires both branches to be valid for the instantiated function.

With `if constexpr`, the discarded branch is not instantiated when the condition is false.

```cpp
template <typename T>
void process(T value)
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

This works because only the appropriate branch needs to be instantiated.

## Type-specific behavior

```cpp
template <typename T>
auto sizeOf(T value)
{
    if constexpr (std::is_pointer_v<T>)
        return sizeof(*value);
    else
        return sizeof(value);
}
```

## Combining type traits

```cpp
template <typename T>
void process(T value)
{
    if constexpr (std::is_integral_v<T>)
    {
        // integral
    }
    else if constexpr (std::is_floating_point_v<T>)
    {
        // floating point
    }
    else
    {
        // other
    }
}
```

## `if constexpr` vs specialization

Many simple type-specific behaviors can be expressed more clearly with `if constexpr` than with multiple specializations.

```text
if constexpr
→ compile-time branch inside one template

specialization
→ separate specialized template definition
```

## `if constexpr` vs runtime `if`

```cpp
if (condition)
```

is a runtime decision.

```cpp
if constexpr (condition)
```

is evaluated at compile time.

## Interview point

The most important feature is **discarded statements**: the non-selected branch is not instantiated for that template specialization.

## Version

`if constexpr` → C++17
