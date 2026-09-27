# `consteval` Functions

`consteval` creates an **immediate function**.

```cpp
consteval int square(int x)
{
    return x * x;
}
```

Calls must produce a constant-evaluated result:

```cpp
constexpr int x = square(5);
```

A runtime variable cannot be passed:

```cpp
int n = 5;
// int x = square(n); // error
```

### Difference

```text
constexpr -> may run at compile time or runtime
consteval -> must be evaluated at compile time
```

`consteval` was introduced in C++20.

**Interview:** `consteval` is stronger than `constexpr`.
