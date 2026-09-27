# Enum Scoping

## Legacy enum

Traditional enum enumerators are visible in the surrounding scope:

```cpp
enum Color
{
    Red,
    Green
};

Color c = Red;
```

## enum class

Scoped enums keep enumerators inside the enum:

```cpp
enum class Color
{
    Red,
    Green
};

Color c = Color::Red;
```

`Red` alone is not available in the surrounding scope.

## Class scope

```cpp
class Car
{
public:
    enum class State
    {
        Stopped,
        Running
    };
};

Car::State state = Car::State::Running;
```

## Namespace scope

```cpp
namespace Graphics
{
    enum class Color
    {
        Red,
        Green
    };
}

Graphics::Color color = Graphics::Color::Red;
```

## Scope vs underlying type

These are separate concepts:

```cpp
enum class Status : std::uint8_t
{
    Ready,
    Failed
};
```

- `Status` → enum type
- `Status::Ready` → scoped enumerator
- `std::uint8_t` → underlying representation type

## `using enum`

C++20:

```cpp
using enum Status;

Status s = Ready;
```

This changes name lookup convenience, not the fundamental type or scoped nature of the enum.

## Interview checklist

1. Legacy `enum` → unscoped enumerators.
2. `enum class` → scoped enumerators.
3. `enum class` blocks implicit integer conversion.
4. `using enum` is a C++20 feature.
5. Enum scope and underlying representation are separate concepts.
