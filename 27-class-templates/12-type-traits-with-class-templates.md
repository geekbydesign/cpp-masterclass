# Type Traits with Class Templates

Type traits provide compile-time information or transformations involving types.

```cpp
#include <type_traits>

template <typename T>
class NumericBox {
    static_assert(std::is_arithmetic_v<T>,
                  "T must be arithmetic");

    T value;
};
```

Now:

```cpp
NumericBox<int> a;     // OK
NumericBox<double> b;  // OK
```

A non-arithmetic type fails the assertion.

## Useful Traits

```cpp
std::is_integral_v<T>
std::is_floating_point_v<T>
std::is_pointer_v<T>
std::is_same_v<T, U>
std::is_const_v<T>
std::is_base_of_v<Base, Derived>
```

## Type Transformations

```cpp
std::remove_reference_t<T>
std::remove_cv_t<T>
std::decay_t<T>
std::add_pointer_t<T>
```

## Modern C++

When expressing requirements directly, C++20 concepts are often clearer than complex trait expressions.
