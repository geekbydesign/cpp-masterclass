# `auto` Template Parameters

C++17 introduced `auto` for non-type template parameters.

```cpp
template <auto Value>
struct Constant
{
};
```

Examples:

```cpp
Constant<10> a;
Constant<'A'> b;
```

The compiler deduces the type of `Value`.

## Before C++17

You generally needed to specify the NTTP type:

```cpp
template <int Value>
struct Constant
{
};
```

## Example with enum

```cpp
enum class Color
{
    Red,
    Green
};

template <auto Value>
struct Holder
{
};

Holder<Color::Red> h;
```

The type of `Value` is the enum type.

## Why useful?

`auto` NTTPs make generic compile-time values easier to express when the exact type does not need to be written.

## C++17 vs C++20

C++17 introduced `auto` NTTPs.

C++20 further expanded the kinds of structural values that can be used as NTTPs.

## Interview point

Do not confuse:

```cpp
template <typename T>
```

with:

```cpp
template <auto Value>
```

The first is a type parameter; the second is a value parameter whose type is deduced.
