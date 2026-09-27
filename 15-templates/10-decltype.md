# `decltype`

`decltype` obtains the type of an expression without evaluating the expression.

```cpp
int x = 10;

decltype(x) y = 20; // int
```

## Named variable rule

For an unparenthesized name:

```cpp
int x = 10;

decltype(x) y;
```

`decltype(x)` is `int`.

## Expression rules

For expressions:

```cpp
decltype((x))
```

If `x` is an lvalue, the result is:

```cpp
int&
```

This is a common interview trap.

```cpp
int x = 10;

decltype(x) a = x;     // int
decltype((x)) b = x;   // int&
```

## `const`

```cpp
const int x = 10;

decltype(x) y = 20; // const int
```

## Function return types

`decltype` is useful when the return type depends on a template expression:

```cpp
template <typename T, typename U>
auto add(T a, U b) -> decltype(a + b)
{
    return a + b;
}
```

## `decltype(auto)`

```cpp
decltype(auto) get()
{
    return x;
}
```

It uses `decltype` rules for the return expression.

## Does not evaluate

```cpp
decltype(x++) y = 0;
```

`x++` is not executed.

## Interview checklist

Remember the classic distinction:

```cpp
decltype(x)
decltype((x))
```

For a named variable, the first uses the declared type. The second applies expression-value-category rules.
