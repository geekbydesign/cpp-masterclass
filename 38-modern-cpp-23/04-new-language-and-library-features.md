# New C++23 Language and Library Features

C++23 is a major evolution of modern C++, with improvements across the language, standard library, ranges, compile-time programming, and usability.

This file is a high-level revision guide rather than an exhaustive specification.

## 1. `std::expected`

Explicit value-or-error return type:

```cpp
std::expected<int, Error>
```

Useful for APIs where failure is an expected outcome.

## 2. `std::print` / `std::println`

Modern formatted output:

```cpp
std::println("Value = {}", value);
```

## 3. `std::ranges` Improvements

C++23 expands the ranges ecosystem with views such as:

```cpp
std::views::zip
std::views::zip_transform
std::views::adjacent
std::views::pairwise
std::views::chunk
std::views::slide
std::views::chunk_by
std::views::repeat
std::views::cartesian_product
```

## 4. Deducing `this`

C++23 allows an explicit object parameter:

```cpp
struct Widget
{
    template <typename Self>
    void process(this Self&& self)
    {
        // self represents the object
    }
};
```

This can simplify some const/non-const overload patterns and support more reusable member-function implementations.

## 5. `if consteval`

C++23 provides:

```cpp
if consteval
{
    // compile-time evaluation path
}
else
{
    // runtime path
}
```

It is useful when behavior needs to differ depending on whether evaluation is occurring during constant evaluation.

## 6. `constexpr` Improvements

C++23 continues relaxing restrictions around constant evaluation and makes more standard-library functionality usable during compile-time evaluation.

## 7. `std::to_underlying`

C++23 provides:

```cpp
enum class Color : int
{
    Red = 1,
    Blue = 2
};

auto value = std::to_underlying(Color::Red);
```

This provides a clear way to obtain an enum's underlying value.

## 8. `std::unreachable`

C++23 provides:

```cpp
std::unreachable();
```

It communicates to the implementation that execution cannot legitimately reach that point.

It should only be used when the condition is guaranteed; reaching it results in undefined behavior.

## 9. `std::byteswap`

C++23 adds:

```cpp
std::byteswap(value);
```

for reversing the byte order of an integer value.

Useful in low-level and serialization-related code.

## 10. `std::ranges::to`

C++23 makes it easier to materialize a range into a container:

```cpp
auto result =
    values
    | std::views::filter(predicate)
    | std::ranges::to<std::vector>();
```

This complements the lazy ranges/view model.

## 11. `std::generator`

C++23 standardizes a generator abstraction:

```cpp
std::generator<int> numbers()
{
    co_yield 1;
    co_yield 2;
    co_yield 3;
}
```

This builds on the C++20 coroutine machinery.

Availability depends on the compiler and standard library implementation.

## 12. `std::mdspan`

C++23 adds `std::mdspan`, a non-owning multidimensional view over contiguous or otherwise accessible data.

Conceptually:

```text
raw storage
    ↓
  mdspan
    ↓
multidimensional indexing
```

It is useful for numerical, scientific, graphics, and low-level data structures.

## 13. Multidimensional Array Support

C++23 adds more standard-library facilities for multidimensional views and layouts, complementing `mdspan`.

## 14. `std::flat_map` / `std::flat_set`

C++23 introduces flat associative containers.

Conceptually, they provide associative-container semantics backed by contiguous storage.

They can be useful when cache locality is important and the workload fits their characteristics.

## 15. Stacktrace

C++23 adds standard stacktrace facilities:

```cpp
#include <stacktrace>
```

They can help diagnostics and debugging.

## 16. `std::expected` vs Exceptions vs `optional`

A useful mental model:

```text
optional<T>
→ value may be absent

expected<T, E>
→ value or meaningful error

exception
→ exceptional control-flow/error propagation
```

## C++23 Feature Groups

```text
Error handling
    → expected

Output
    → print / println

Ranges
    → zip / chunk / slide / adjacent / repeat / etc.

Coroutines
    → generator

Object model
    → explicit object parameter / deducing this

Compile time
    → if consteval and further constexpr improvements

Low-level
    → byteswap / unreachable

Containers & views
    → flat containers / mdspan

Diagnostics
    → stacktrace
```

## Interview Priority

For C++23 interviews, know the concepts behind:

1. `std::expected`.
2. `std::print` / `std::println`.
3. C++23 ranges/views.
4. `std::ranges::to`.
5. Deducing `this`.
6. `if consteval`.
7. `std::to_underlying`.
8. `std::generator`.
9. `std::mdspan`.
10. Flat associative containers.

## C++11 → C++23 Mental Model

```text
C++11
→ RAII, move semantics, lambdas, smart pointers, threads

C++14
→ generic lambdas, relaxed constexpr, variable templates

C++17
→ structured bindings, optional, variant, string_view, filesystem

C++20
→ concepts, ranges, coroutines, modules, <=>, span

C++23
→ expected, print, richer ranges, generator,
  deducing this, if consteval, mdspan,
  flat containers and more
```

## Important

C++23 support is still more dependent on the compiler and standard-library implementation than older standards. Always verify the feature support of the target toolchain when using newer facilities.
