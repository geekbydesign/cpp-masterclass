# Generic Lambdas

C++14 introduced **generic lambdas**, allowing a lambda parameter to use `auto`.

## C++11 Lambda

```cpp
auto add = [](int a, int b)
{
    return a + b;
};
```

The parameter types are fixed.

## C++14 Generic Lambda

```cpp
auto add = [](auto a, auto b)
{
    return a + b;
};
```

The same lambda can work with different types:

```cpp
add(10, 20);
add(2.5, 3.5);
```

The compiler generates the appropriate call operator for the argument types.

## Generic Lambda Internally

Conceptually:

```cpp
[](auto x)
{
    return x * 2;
}
```

is similar to a function object with a templated call operator:

```cpp
struct Lambda
{
    template <typename T>
    auto operator()(T x) const
    {
        return x * 2;
    }
};
```

## Multiple Generic Parameters

```cpp
auto add = [](auto a, auto b)
{
    return a + b;
};
```

The arguments do not have to have the same type, as long as the expression is valid.

```cpp
add(10, 2.5);
```

## Generic Lambda with `const auto&`

Useful when you want to avoid copying:

```cpp
auto print = [](const auto& value)
{
    std::cout << value;
};
```

## C++20 Improvement

C++20 allows an explicit template parameter list:

```cpp
auto lambda = []<typename T>(T value)
{
    return value;
};
```

This is **not C++14**.

## Key Point

```text
C++11 → lambda
C++14 → generic lambda using auto parameters
C++20 → explicit template parameter lists for lambdas
```

## Interview Point

A generic lambda is essentially a closure object whose call operator is templated.
