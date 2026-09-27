# Building Custom Concepts

You can define your own concepts using a boolean constraint expression.

## Basic custom concept

```cpp
template <typename T>
concept Number =
    std::integral<T> ||
    std::floating_point<T>;
```

Use it:

```cpp
template <Number T>
T multiply(T a, T b)
{
    return a * b;
}
```

## Concept using expressions

C++20 concepts can check whether expressions are valid.

```cpp
template <typename T>
concept Addable = requires(T a, T b)
{
    a + b;
};
```

Now:

```cpp
template <Addable T>
auto add(T a, T b)
{
    return a + b;
}
```

## Return-type requirement

You can require an expression to return a particular type:

```cpp
template <typename T>
concept AddableToInt = requires(T a, T b)
{
    { a + b } -> std::convertible_to<int>;
};
```

## Multiple requirements

```cpp
template <typename T>
concept Printable = requires(T value)
{
    std::cout << value;
};
```

A concept can combine multiple requirements:

```cpp
template <typename T>
concept Valid = requires(T value)
{
    value.begin();
    value.end();
};
```

## Concept composition

```cpp
template <typename T>
concept Numeric =
    std::integral<T> ||
    std::floating_point<T>;
```

Then:

```cpp
template <Numeric T>
void process(T value)
{
}
```

## Good custom concepts

A useful concept should express a meaningful requirement rather than merely hiding complicated syntax.

Examples:

```cpp
template <typename T>
concept HasSize = requires(T value)
{
    value.size();
};
```

## Interview point

Custom concepts are named, reusable compile-time constraints. They make template interfaces communicate their requirements directly.
