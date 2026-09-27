# `decltype` and Return Types

`decltype` obtains a type based on an expression.

```cpp
int x = 10;
decltype(x) y = 20; // int
```

It is useful when a function should return an expression's exact type.

```cpp
template <typename T, typename U>
auto add(T a, U b) -> decltype(a + b)
{
    return a + b;
}
```

Modern C++ often allows:

```cpp
template <typename T, typename U>
auto add(T a, U b)
{
    return a + b;
}
```

### Important

`decltype` preserves reference/value category rules differently from plain `auto`.

**Interview:** Know the difference between `auto` type deduction and `decltype(expr)` deduction.
