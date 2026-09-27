# Concepts with Class Templates

C++20 concepts allow class templates to express requirements directly.

```cpp
template <typename T>
concept Numeric = std::is_arithmetic_v<T>;

template <Numeric T>
class Box {
    T value;
};
```

Usage:

```cpp
Box<int> a;       // OK
Box<double> b;    // OK
// Box<std::string> c; // constraint failure
```

## `requires` Clause

```cpp
template <typename T>
requires std::is_arithmetic_v<T>
class Box {
};
```

## Combining Concepts

```cpp
template <typename T>
concept Addable = requires(T a, T b) {
    a + b;
};

template <Addable T>
class Calculator {
};
```

## Concepts vs `static_assert`

### `static_assert`
The template can be selected first, then an invalid requirement is diagnosed.

### Concept
The requirement participates in template constraints and overload/specialization selection.

Concepts usually provide clearer diagnostics and cleaner interfaces.

## Interview Tip

For modern C++20 code:

```text
Templates + concepts
```

is often preferable to deeply nested SFINAE/type-trait machinery.
