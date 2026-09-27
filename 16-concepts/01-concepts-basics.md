# Concepts Basics

Concepts are a **C++20** feature used to constrain template arguments.

They make template requirements explicit and improve compiler diagnostics.

## Basic example

```cpp
#include <concepts>

template <typename T>
requires std::integral<T>
T add(T a, T b)
{
    return a + b;
}
```

Now:

```cpp
add(10, 20);     // OK
add(2.5, 3.5);   // Error: double is not integral
```

## Concept syntax

A concept is a named compile-time predicate:

```cpp
template <typename T>
concept MyConcept = /* constraint */;
```

Example:

```cpp
template <typename T>
concept Number = std::integral<T> || std::floating_point<T>;
```

## Using a concept

```cpp
template <Number T>
T add(T a, T b)
{
    return a + b;
}
```

Equivalent constraint style:

```cpp
template <typename T>
requires Number<T>
T add(T a, T b)
{
    return a + b;
}
```

## Why concepts?

Before C++20, templates often relied on:

- SFINAE
- `std::enable_if`
- type traits
- complicated overload techniques

Concepts provide a clearer way to express requirements.

## Benefits

### Readability

```cpp
template <std::integral T>
void process(T value);
```

immediately communicates the requirement.

### Better diagnostics

When a constraint is not satisfied, the compiler can report which requirement failed.

### Overload selection

Concepts can participate in template overload resolution.

## Concept vs type trait

A type trait typically produces a compile-time value:

```cpp
std::is_integral_v<T>
```

A concept gives a named constraint:

```cpp
std::integral<T>
```

## Version

Concepts → **C++20**
