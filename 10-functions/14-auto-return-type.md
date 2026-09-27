# `auto` Return Type

C++14 allows return type deduction:

```cpp
auto add(int a, int b)
{
    return a + b;
}
```

All return statements must deduce a compatible type.

```cpp
auto f(bool condition)
{
    if (condition)
        return 10;
    return 20;
}
```

For multiple branches, incompatible return types cause an error.

For recursive functions, the compiler needs enough information to deduce the return type; a common safe pattern is to provide an explicit return type when deduction would depend on the function itself.

**Interview:** `auto` return type is useful when the return type is obvious from the implementation.
