# Non-Type Template Parameters

A non-type template parameter (NTTP) is a template parameter representing a compile-time value rather than a type.

```cpp
template <typename T, std::size_t N>
class Array {
    T data[N];
};
```

Usage:

```cpp
Array<int, 10> a;
Array<double, 5> b;
```

`10` and `5` are part of the template type.

## C++17 Example

```cpp
template <int Size>
class Buffer {
    char data[Size];
};
```

## `auto` NTTP

C++17 allows:

```cpp
template <auto Value>
struct Constant {
};
```

## Modern C++

C++20 expanded the kinds of structural values that can be used as non-type template arguments.

## Key Point

```text
typename T → compile-time type parameter
std::size_t N → compile-time value parameter
```
