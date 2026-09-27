# Modern C++20 Summary

C++20 introduced several major language and library features.

## Major Language Features

### Concepts

Constrain templates directly:

```cpp
template <std::integral T>
T add(T a, T b);
```

### Ranges

Modern range-based algorithms and lazy views:

```cpp
values
    | std::views::filter(predicate)
    | std::views::transform(transform);
```

### Coroutines

Suspendable/resumable functions:

```cpp
co_await
co_yield
co_return
```

### Modules

Language-level module interfaces:

```cpp
export module math;
import math;
```

### Three-Way Comparison

```cpp
a <=> b
```

with ordering categories such as:

```cpp
std::strong_ordering
std::weak_ordering
std::partial_ordering
```

## Major Library Features

### `std::span`

Non-owning view over contiguous data:

```cpp
void process(std::span<int> data);
```

### `std::ranges`

Range algorithms, views, adaptors and projections.

## Compile-Time Features

### `consteval`

Immediate functions:

```cpp
consteval int f(int x)
{
    return x * 2;
}
```

### `constinit`

Enforce static initialization:

```cpp
constinit int value = 42;
```

## Initialization

### Designated Initializers

```cpp
Point p{
    .x = 10,
    .y = 20
};
```

## C++17 → C++20 Quick Comparison

| C++17 | C++20 |
|---|---|
| `if constexpr` | Concepts |
| `std::optional` | Ranges |
| `std::variant` | Coroutines |
| `std::any` | Modules |
| `std::string_view` | `<=>` |
| `std::filesystem` | `std::span` |
| Fold expressions | `consteval` |
| Structured bindings | `constinit` |
| Inline variables | Designated initializers |

## Interview Priority

Know these especially well:

1. Concepts and `requires`.
2. Ranges and views.
3. Coroutines at the conceptual level.
4. Modules and partitions.
5. `<=>` and comparison categories.
6. `std::span` and lifetime.
7. `consteval` vs `constexpr`.
8. `constinit` vs `constexpr`.
9. Designated initializer rules.

## One-Line Mental Model

```text
C++20
→ constrained templates
→ composable ranges
→ resumable execution
→ module-based dependencies
→ modern comparisons
→ safer non-owning views
→ stronger compile-time programming
```
