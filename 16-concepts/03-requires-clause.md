# `requires` Clause

The `requires` clause specifies constraints that must be satisfied for a template to participate.

## Basic syntax

```cpp
template <typename T>
requires std::integral<T>
void process(T value)
{
}
```

## Concept in a requires clause

```cpp
template <typename T>
concept Number =
    std::integral<T> ||
    std::floating_point<T>;

template <typename T>
requires Number<T>
void process(T value)
{
}
```

## Compound requirements

A requires-expression can check expressions and their result types:

```cpp
template <typename T>
concept Addable = requires(T a, T b)
{
    { a + b } -> std::convertible_to<T>;
};
```

## Nested requirements

A requires-expression can contain additional constraints:

```cpp
template <typename T>
concept PositiveSize = requires(T value)
{
    value.size();

    requires std::unsigned_integral<decltype(value.size())>;
};
```

## Simple requirements

```cpp
template <typename T>
concept HasBegin = requires(T value)
{
    value.begin();
};
```

The expression only needs to be valid.

## Type requirements

You can require a nested type:

```cpp
template <typename T>
concept HasValueType = requires
{
    typename T::value_type;
};
```

## `requires` expression vs `requires` clause

A **requires-expression** produces a compile-time boolean:

```cpp
requires(T value)
{
    value.size();
}
```

A **requires-clause** constrains a declaration:

```cpp
template <typename T>
requires HasSize<T>
void process(T value);
```

## Interview point

Remember:

```text
requires-expression
→ checks whether requirements are valid

requires-clause
→ constrains a template/declaration
```
