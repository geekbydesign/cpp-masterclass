# `decltype(auto)`

`decltype(auto)` combines `auto` syntax with `decltype` deduction rules.

```cpp
int value = 10;

decltype(auto) x = value;
```

## Why it matters

`auto` can drop references:

```cpp
int value = 10;
int& ref = value;

auto a = ref;           // int
decltype(auto) b = ref; // int&
```

## Return values

Consider:

```cpp
int value = 10;

decltype(auto) get()
{
    return value;
}
```

Because `value` is an unparenthesized name, the return type is `int`.

If the expression is:

```cpp
decltype(auto) get()
{
    return (value);
}
```

the return type becomes `int&`.

## Common trap

```cpp
decltype(auto) get()
{
    int value = 10;
    return (value); // returns int& -> dangling reference
}
```

The function returns a reference to a local variable that has already been destroyed.

## `auto` vs `decltype(auto)`

| Syntax | Main behavior |
|---|---|
| `auto` | Normal template-like value deduction |
| `decltype(auto)` | Exact `decltype` rules |

## Interview point

Use `decltype(auto)` when preserving the exact type, including reference-ness, is intentional. Do not use it blindly.
