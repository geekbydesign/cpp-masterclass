# `std::optional`

`std::optional<T>` contains either a `T` or no value.

C++17:

```cpp
#include <optional>

std::optional<int> find(bool found)
{
    if (found)
        return 42;

    return std::nullopt;
}
```

## Check

```cpp
auto result = find(true);

if (result.has_value())
    std::cout << *result;
```

Or:

```cpp
if (result)
    std::cout << *result;
```

## `value_or`

```cpp
int x = result.value_or(0);
```

## `value()`

```cpp
result.value();
```

Throws `std::bad_optional_access` if no value exists.

**Interview:** `optional` models absence of a value; it does not represent ownership.
