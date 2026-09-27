# `std::variant`

C++17 introduced `std::variant` as a type-safe discriminated union.

Header:

```cpp
#include <variant>
```

## Basic Example

```cpp
std::variant<int, std::string> value;

value = 42;
value = "hello";
```

At any time, the variant contains one alternative.

## Access with `std::get`

```cpp
std::variant<int, std::string> value = 42;

std::cout << std::get<int>(value);
```

You can also access by index:

```cpp
std::get<0>(value);
```

If the requested alternative is not active, `std::get` throws `std::bad_variant_access`.

## `std::holds_alternative`

```cpp
if (std::holds_alternative<int>(value))
{
    std::cout << std::get<int>(value);
}
```

## `std::get_if`

Avoid an exception by checking:

```cpp
if (auto* p = std::get_if<int>(&value))
{
    std::cout << *p;
}
```

## `std::visit`

Use a visitor to handle the active alternative:

```cpp
std::visit(
    [](const auto& value)
    {
        std::cout << value;
    },
    value
);
```

## Why Variant?

Instead of unsafe unions:

```text
std::variant<int, string>
        ↓
type-safe alternative
        ↓
exactly one active value
```

## Optional vs Variant

```text
optional<T>
→ T or no value

variant<A, B, C>
→ one of A/B/C
```

## Interview Point

`std::variant` provides type-safe alternatives and tracks which alternative is currently active.
