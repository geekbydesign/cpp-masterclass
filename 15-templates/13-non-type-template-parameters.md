# Non-Type Template Parameters

A non-type template parameter (NTTP) is a compile-time value parameter rather than a type parameter.

```cpp
template <std::size_t N>
void process()
{
}
```

Usage:

```cpp
process<10>();
```

## Array size example

```cpp
template <typename T, std::size_t N>
std::size_t arraySize(T (&)[N])
{
    return N;
}
```

```cpp
int values[5];

arraySize(values); // 5
```

## Integral NTTP

```cpp
template <int Size>
struct Buffer
{
    char data[Size];
};

Buffer<256> buffer;
```

## C++17 and `auto` NTTP

C++17 allows:

```cpp
template <auto Value>
struct Constant
{
};
```

Examples:

```cpp
Constant<42> a;
Constant<'A'> b;
```

The compiler deduces the type of the non-type argument.

## C++20 expansion

C++20 expanded the kinds of values that can be used as non-type template parameters, including suitable structural types.

## Compile-time nature

NTTP values are part of the template specialization:

```cpp
Buffer<10>
Buffer<20>
```

These are different types.

## Interview points

- NTTPs are compile-time values.
- Common examples: sizes, integers, enum values.
- `auto` NTTPs were introduced in C++17.
- C++20 expanded NTTP capabilities.
