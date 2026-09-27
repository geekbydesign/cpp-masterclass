# `std::optional`

C++17 introduced `std::optional<T>` to represent a value that may or may not exist.

Header:

```cpp
#include <optional>
```

## Basic Example

```cpp
std::optional<int> value;

value = 42;
```

An optional can be empty:

```cpp
std::optional<int> value;
```

## Check for a Value

```cpp
if (value)
{
    std::cout << *value;
}
```

Or:

```cpp
if (value.has_value())
{
    std::cout << value.value();
}
```

## `value_or`

Provide a fallback:

```cpp
int result = value.value_or(0);
```

## Return Optional

Useful when a function may not produce a result:

```cpp
std::optional<int> findValue(int x)
{
    if (x > 0)
        return x;

    return std::nullopt;
}
```

## `std::nullopt`

Represents an empty optional:

```cpp
return std::nullopt;
```

## Access

```cpp
*value
value.value()
value.value_or(defaultValue)
```

Calling `.value()` on an empty optional throws `std::bad_optional_access`.

## Optional Is Not a Pointer

`std::optional<T>` normally stores the object as part of the optional's storage. It represents optional presence, not ownership.

## Good Use Cases

```text
function may return a value
configuration value may be absent
search result may not exist
```

## Interview Point

Use `optional` when "no value" is a valid result and does not need to represent an error category by itself.
