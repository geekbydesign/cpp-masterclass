# Explicit Template Arguments

Template arguments can be supplied explicitly instead of relying on deduction.

```cpp
template <typename T>
T maximum(T a, T b)
{
    return a > b ? a : b;
}

maximum<int>(10, 20);
maximum<double>(2.5, 1.5);
```

## Why specify them explicitly?

Explicit arguments are useful when:

- deduction would fail
- you want a particular type
- conversions are desired
- multiple template parameters are involved

Example:

```cpp
template <typename T>
void process(T value)
{
}

process<double>(10);
```

Here `T` is explicitly `double`, so `10` is converted to `double`.

## Multiple template parameters

```cpp
template <typename T, typename U>
auto convert(U value)
{
    return static_cast<T>(value);
}

auto x = convert<double>(10);
```

If later template parameters can be deduced, you generally specify the earlier ones and let deduction handle the rest when possible.

## Explicit function template specialization call

```cpp
maximum<int>(10, 20);
```

Here `<int>` specifies the template argument; it does not mean a class template is being instantiated.

## Interview point

Know the distinction:

```cpp
maximum(10, 20);       // deduction
maximum<int>(10, 20);  // explicit template argument
```
