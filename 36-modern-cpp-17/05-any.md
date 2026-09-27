# `std::any`

C++17 introduced `std::any` for storing a value of almost any copyable type.

Header:

```cpp
#include <any>
```

## Basic Example

```cpp
std::any value = 42;

value = std::string{"hello"};
```

The type can change at runtime.

## Check Type

```cpp
if (value.type() == typeid(std::string))
{
}
```

## `std::any_cast`

```cpp
int x = std::any_cast<int>(value);
```

If the stored type does not match, `std::any_cast` can throw `std::bad_any_cast`.

Pointer form:

```cpp
if (auto* p = std::any_cast<int>(&value))
{
    std::cout << *p;
}
```

## Empty `any`

```cpp
std::any value;
```

Check:

```cpp
if (!value.has_value())
{
}
```

Reset:

```cpp
value.reset();
```

## `any` vs `variant`

```text
variant
→ set of known types at compile time

any
→ type can be essentially arbitrary at runtime
```

`variant` generally provides stronger compile-time type information.

## When to Use

Use `std::any` when:
- The possible types cannot reasonably be enumerated.
- Runtime type erasure is useful.
- You need heterogeneous values.

Avoid it when a known set of alternatives can be represented more clearly with `std::variant`.

## Interview Point

`std::any` is type-safe compared with a raw `void*`, but retrieving the wrong type still fails at runtime.
