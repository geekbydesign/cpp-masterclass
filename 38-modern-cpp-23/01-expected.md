# `std::expected`

C++23 introduced `std::expected<T, E>` for representing either a successful value or an error.

Header:

```cpp
#include <expected>
```

## Basic Example

```cpp
std::expected<int, std::string> divide(int a, int b)
{
    if (b == 0)
        return std::unexpected("division by zero");

    return a / b;
}
```

## Check for Success

```cpp
auto result = divide(10, 2);

if (result)
{
    std::cout << *result;
}
else
{
    std::cout << result.error();
}
```

You can also use:

```cpp
result.has_value();
```

## `std::unexpected`

Use `std::unexpected` to return an error:

```cpp
return std::unexpected("invalid input");
```

## Access

```cpp
*result
result.value()
result.error()
```

Calling `value()` when the object contains an error throws `std::bad_expected_access`.

## `value_or`

A fallback can be supplied:

```cpp
int value = result.value_or(0);
```

## Why `expected`?

It makes the success/error relationship explicit in the return type.

```text
expected<T, E>
       ↓
   ┌───┴────┐
 success   error
    T         E
```

It is particularly useful when an operation can fail in an expected, non-exceptional way.

## `optional` vs `expected`

```text
optional<T>
→ value or no value

expected<T, E>
→ value or explicit error information
```

## Exceptions vs `expected`

`expected` is useful when failure is part of the normal API result and the caller is expected to handle it explicitly.

Exceptions remain useful for exceptional failure and stack-based error propagation.

## Interview Point

`std::expected` is a C++23 value-or-error type and is useful for explicit error handling without encoding errors as special values.
