# `constexpr`

`constexpr` is used for entities and functions that can participate in constant evaluation.

## 1. `constexpr` Variable

```cpp
constexpr int size = 100;
```

The initializer must be suitable for constant evaluation.

This can be used where a compile-time constant is required:

```cpp
constexpr int size = 10;
int values[size];
```

## 2. `constexpr` Function

```cpp
constexpr int square(int x)
{
    return x * x;
}
```

Compile-time use:

```cpp
constexpr int result = square(5);
```

A `constexpr` function can also be called at runtime when the arguments are not constant expressions.

```cpp
int x = 5;
int result = square(x);
```

So `constexpr` does not mean "the function always runs at compile time."

## 3. `constexpr` vs `const`

```cpp
const int a = 10;
constexpr int b = 10;
```

`const` means the object cannot be modified after initialization.

`constexpr` additionally requires the initializer to produce a constant expression where applicable.

A `constexpr` variable is implicitly `const`.

## 4. `constexpr` Object

```cpp
struct Point
{
    int x;
    int y;
};

constexpr Point p{10, 20};
```

The object can be used in constant evaluation when the type and initialization permit it.

## 5. `constexpr` Constructor

Modern C++ allows constructors to be `constexpr`.

```cpp
class Number
{
public:
    constexpr Number(int value)
        : value(value)
    {
    }

    constexpr int get() const
    {
        return value;
    }

private:
    int value;
};

constexpr Number n{42};
constexpr int value = n.get();
```

## 6. Compile-Time vs Runtime

```cpp
constexpr int square(int x)
{
    return x * x;
}

constexpr int a = square(5); // compile-time evaluation

int x = 5;
int b = square(x);           // may execute at runtime
```

The function is capable of constant evaluation; the call context determines whether it is required.

## 7. `constexpr` and `if constexpr`

`if constexpr` performs compile-time branch selection.

```cpp
template <typename T>
void process(T value)
{
    if constexpr (std::is_integral_v<T>)
    {
        // integral case
    }
    else
    {
        // non-integral case
    }
}
```

## 8. Evolution Across C++ Versions

`constexpr` became progressively more capable in C++14, C++17, C++20 and later standards.

Do not assume that every operation allowed in a normal function is allowed in a `constexpr` function for every language version.

## Quick Revision

```text
const       → cannot modify
constexpr   → usable in constant evaluation
```

Important:

> A `constexpr` function can also be called at runtime.

## Interview Question

### Is `constexpr` the same as "compile-time execution"?

No. It makes constant evaluation possible and required in contexts such as initialization of a `constexpr` variable, but the same function can be called at runtime with runtime values.
