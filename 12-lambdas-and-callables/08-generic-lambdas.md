# Generic Lambdas

Generic lambdas were introduced in C++14.

Use `auto` in lambda parameters:

```cpp
auto print = [](auto value)
{
    std::cout << value;
};
```

The compiler generates the appropriate call operator for the argument types.

## Multiple generic parameters

```cpp
auto add = [](auto a, auto b)
{
    return a + b;
};
```

Examples:

```cpp
add(2, 3);
add(2.5, 3.5);
```

## Equivalent idea

A generic lambda behaves similarly to a function object with a templated call operator.

Conceptually:

```cpp
struct Add
{
    template <typename T, typename U>
    auto operator()(T a, U b) const
    {
        return a + b;
    }
};
```

## Generic lambda with capture

```cpp
int factor = 10;

auto multiply = [factor](auto value)
{
    return value * factor;
};
```

## Explicit template parameters

C++20 allows template parameter lists for lambdas:

```cpp
auto add = []<typename T>(T a, T b)
{
    return a + b;
};
```

## Generic lambdas with algorithms

```cpp
std::vector<int> values{1, 2, 3};

std::for_each(values.begin(), values.end(),
              [](auto& value)
              {
                  value *= 2;
              });
```

## Version

- Generic lambda with `auto` → C++14
- Explicit template parameter list → C++20

## Interview point

A generic lambda is not one runtime function that magically accepts every type. Its call operator is templated, so the compiler can generate appropriate specializations.
