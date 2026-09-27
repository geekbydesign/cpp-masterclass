# Trailing Return Types

A trailing return type moves the return type after the parameter list.

```cpp
auto add(int a, int b) -> int
{
    return a + b;
}
```

## Why use it?

It is especially useful when the return type depends on parameter names.

```cpp
template <typename T, typename U>
auto add(T a, U b) -> decltype(a + b)
{
    return a + b;
}
```

With the traditional syntax, parameter names are not available before the parameter list.

## Function template example

```cpp
template <typename T>
auto getValue(T& object) -> decltype(object.getValue())
{
    return object.getValue();
}
```

## Modern alternative

In many cases, C++14 return type deduction is simpler:

```cpp
template <typename T, typename U>
auto add(T a, U b)
{
    return a + b;
}
```

## When you may still see it

- older template code
- code using `decltype`
- APIs where an explicit dependent return type is useful
- code written before C++14 return type deduction

## Syntax

```cpp
auto function(parameters) -> return_type
{
}
```

## Interview point

Trailing return types are particularly useful for **dependent return types** where the return type depends on parameter expressions.
