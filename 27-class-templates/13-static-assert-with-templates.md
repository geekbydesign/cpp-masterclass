# `static_assert` with Templates

`static_assert` performs a compile-time assertion.

```cpp
template <typename T>
class Buffer {
    static_assert(sizeof(T) <= 16,
                  "T is too large");

    T value;
};
```

If the condition is false, compilation fails with the supplied message.

## With Type Traits

```cpp
template <typename T>
class IntegerBox {
    static_assert(std::is_integral_v<T>,
                  "T must be an integral type");
};
```

## With Values

```cpp
template <std::size_t N>
struct Array {
    static_assert(N > 0);
};
```

## Why Use It?

`static_assert` gives an immediate compile-time diagnostic instead of allowing an invalid template instantiation to produce confusing errors later.

## C++17

The message is optional:

```cpp
static_assert(sizeof(T) > 0);
```
