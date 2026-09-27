# Partial Template Specialization

Partial specialization provides a specialized implementation for a family of template arguments.

```cpp
template <typename T>
class Wrapper {
};

template <typename T>
class Wrapper<T*> {
};
```

The second version matches pointer types:

```cpp
Wrapper<int*> a;
Wrapper<double*> b;
```

## Multiple Parameters

```cpp
template <typename T, typename U>
class Pair {
};

template <typename T>
class Pair<T, int> {
};
```

This matches any `Pair<T, int>`.

## Important

Function templates cannot be partially specialized.

For functions, use:
- Overloading.
- Concepts.
- `if constexpr`.
- Other dispatch techniques.

Partial specialization is primarily a class/variable template technique.
