# Concepts and `auto`

C++20 allows concepts to be used with abbreviated function templates and constrained `auto`.

## Constrained parameter

Instead of:

```cpp
template <std::integral T>
void process(T value)
{
}
```

you can write:

```cpp
void process(std::integral auto value)
{
}
```

This is an **abbreviated function template**.

## Custom concept

```cpp
template <typename T>
concept Number =
    std::integral<T> ||
    std::floating_point<T>;

void process(Number auto value)
{
}
```

## Multiple constrained parameters

```cpp
void add(std::integral auto a,
         std::integral auto b)
{
    return a + b;
}
```

Each `auto` represents a deduced template parameter.

## Constrained variable

Concepts can also constrain placeholder variables:

```cpp
std::integral auto value = 10;
```

The deduced type must satisfy the concept.

## `auto` vs constrained `auto`

```cpp
auto value = 10;
```

accepts whatever type is deduced.

```cpp
std::integral auto value = 10;
```

requires the deduced type to satisfy `std::integral`.

## Equivalent forms

These are conceptually equivalent:

```cpp
template <std::integral T>
void process(T value)
{
}
```

and:

```cpp
void process(std::integral auto value)
{
}
```

## Benefits

Constrained `auto` is useful for concise local generic functions and APIs where the constraint is easy to understand directly at the parameter.

## Version

Constrained placeholders / abbreviated templates → **C++20**
