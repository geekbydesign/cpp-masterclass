# Type Traits

Type traits provide compile-time information or transformations about types.

Header:

```cpp
#include <type_traits>
```

## Query traits

```cpp
std::is_integral_v<int>
std::is_floating_point_v<double>
std::is_pointer_v<int*>
```

These are C++17 `_v` variable-template forms.

## Example

```cpp
template <typename T>
void process(T value)
{
    if constexpr (std::is_integral_v<T>)
    {
        // integral type
    }
}
```

## Common traits

```cpp
std::is_same_v<T, U>
std::is_const_v<T>
std::is_reference_v<T>
std::is_pointer_v<T>
std::is_integral_v<T>
std::is_floating_point_v<T>
std::is_class_v<T>
```

## Type transformations

Traits can also transform types:

```cpp
std::remove_reference_t<T>
std::remove_const_t<T>
std::add_const_t<T>
std::decay_t<T>
std::remove_cv_t<T>
```

## `_t` shorthand

Older form:

```cpp
typename std::remove_reference<T>::type
```

C++14 introduced convenient `_t` aliases:

```cpp
std::remove_reference_t<T>
```

## `_v` shorthand

Older:

```cpp
std::is_integral<T>::value
```

C++17:

```cpp
std::is_integral_v<T>
```

## `std::is_same`

Useful for checking exact types:

```cpp
static_assert(std::is_same_v<int, int>);
```

## Why type traits matter

They are commonly used with:

- generic programming
- compile-time checks
- overload selection
- `if constexpr`
- template constraints
- type transformations

## Interview point

Know the distinction:

```text
is_*       → query a property
remove_*   → transform a type
*_t        → type alias result
*_v        → value result
```
