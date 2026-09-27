# Standard Library Concepts

C++20 provides many concepts in the standard library, especially in `<concepts>`.

```cpp
#include <concepts>
```

## Common type concepts

### `std::same_as`

Checks whether two types are the same:

```cpp
std::same_as<T, U>
```

### `std::derived_from`

Checks whether one type is derived from another:

```cpp
std::derived_from<Derived, Base>
```

### `std::convertible_to`

Checks whether one type can be implicitly and explicitly converted to another according to the concept's requirements:

```cpp
std::convertible_to<T, U>
```

## Arithmetic concepts

```cpp
std::integral<T>
std::signed_integral<T>
std::unsigned_integral<T>
std::floating_point<T>
```

Example:

```cpp
template <std::integral T>
void process(T value)
{
}
```

## Object-related concepts

```cpp
std::destructible<T>
std::constructible_from<T, Args...>
std::default_initializable<T>
std::move_constructible<T>
std::copy_constructible<T>
```

## Assignment concepts

```cpp
std::assignable_from<T&, U>
```

## Common comparison concepts

```cpp
std::equality_comparable<T>
std::totally_ordered<T>
```

These express requirements for comparison operations.

## Invocable concepts

```cpp
std::invocable<F, Args...>
std::regular_invocable<F, Args...>
```

Useful for generic callable code.

Example:

```cpp
template <typename F, typename T>
requires std::invocable<F, T>
void execute(F function, T value)
{
    function(value);
}
```

## Why use standard concepts?

Prefer standard concepts when they already express the requirement you need.

```cpp
template <std::integral T>
void process(T value);
```

is clearer than rebuilding the same constraint with type traits.

## Header

Most fundamental language-library concepts are available through:

```cpp
#include <concepts>
```

Some range/iterator concepts are provided by their associated standard-library headers.

## Interview checklist

Know the purpose of:

```text
same_as
derived_from
convertible_to
integral
signed_integral
unsigned_integral
floating_point
constructible_from
default_initializable
copy_constructible
move_constructible
equality_comparable
totally_ordered
invocable
regular_invocable
```

## Version

Standard library concepts → **C++20**
