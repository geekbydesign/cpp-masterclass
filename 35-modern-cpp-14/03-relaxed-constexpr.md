# Relaxed `constexpr`

C++14 relaxed several restrictions on `constexpr` functions.

The goal was to make compile-time functions much easier to write.

## C++11 Restriction

A C++11 `constexpr` function had significant restrictions and was generally written as a single return expression.

```cpp
constexpr int square(int x)
{
    return x * x;
}
```

## C++14

C++14 allows a `constexpr` function to contain normal control-flow constructs such as:

- Local variables.
- `if` statements.
- Loops.
- Multiple statements.

Example:

```cpp
constexpr int factorial(int n)
{
    int result = 1;

    for (int i = 2; i <= n; ++i)
    {
        result *= i;
    }

    return result;
}
```

This can be evaluated at compile time:

```cpp
constexpr int value = factorial(5);
```

## Local Variables

```cpp
constexpr int calculate(int x)
{
    int result = x * 2;
    result += 10;

    return result;
}
```

## Conditional Logic

```cpp
constexpr int abs_value(int x)
{
    if (x < 0)
        return -x;

    return x;
}
```

## Important Distinction

`constexpr` means a function **can participate in constant evaluation** when the arguments and context permit it.

It does not mean every call is necessarily evaluated at compile time.

```cpp
int x = 10;

int result = square(x);
```

This may execute at runtime because `x` is not a constant expression.

## C++14 vs Later Standards

C++14 relaxed `constexpr` significantly.

Later standards relaxed it further, so avoid assuming that every modern `constexpr` rule existed in C++14.

## Interview Point

The major C++14 `constexpr` improvement is:

```text
C++11 → highly restricted constexpr function bodies
C++14 → multi-statement constexpr functions with local variables/control flow
```
