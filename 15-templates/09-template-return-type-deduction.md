# Template Return Type Deduction

Function templates can use `auto` to deduce their return type.

```cpp
template <typename T, typename U>
auto add(T a, U b)
{
    return a + b;
}
```

For:

```cpp
add(10, 2.5);
```

the return type is deduced from the return expression.

## Multiple return statements

With deduced return type, return statements generally need to deduce to the same type.

```cpp
auto f(bool condition)
{
    if (condition)
        return 10;

    return 20;
}
```

Both are `int`.

This is problematic:

```cpp
auto f(bool condition)
{
    if (condition)
        return 10;

    return 2.5; // inconsistent deduced return type
}
```

## `decltype(auto)`

`decltype(auto)` preserves the exact type produced by `decltype`:

```cpp
template <typename T>
decltype(auto) get(T& value)
{
    return value;
}
```

If `value` is an lvalue, the return can preserve the reference.

## Important difference

```cpp
auto
```

generally performs type deduction similar to value initialization.

```cpp
decltype(auto)
```

uses `decltype` rules and can preserve references and cv-qualification.

## Trailing return type

For dependent expressions:

```cpp
template <typename T, typename U>
auto add(T a, U b) -> decltype(a + b)
{
    return a + b;
}
```

## Interview point

Know when to use:

- `auto` → normal return type deduction
- `decltype(auto)` → preserve exact `decltype` result
- explicit return type → when clarity or control is preferred
