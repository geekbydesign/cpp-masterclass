# Template Specialization

Template specialization provides a different implementation for a specific template argument.

## Full function template specialization

```cpp
template <typename T>
void print(T value)
{
    std::cout << value;
}

template <>
void print<bool>(bool value)
{
    std::cout << (value ? "true" : "false");
}
```

The second definition is a specialization for `bool`.

## Why specialize?

Use specialization when a particular type needs behavior different from the primary template.

## Class template specialization

Full specialization is especially common with class templates:

```cpp
template <typename T>
struct Traits
{
    static constexpr int value = 0;
};

template <>
struct Traits<int>
{
    static constexpr int value = 1;
};
```

## Partial specialization

Partial specialization applies to class templates, not function templates.

```cpp
template <typename T>
struct Wrapper
{
};

template <typename T>
struct Wrapper<T*>
{
};
```

This specialization matches pointer types.

## Full vs partial

```text
Full specialization
→ exact template arguments

Partial specialization
→ pattern of template arguments
```

## Important interview point

Function templates cannot be partially specialized. If you need function-template-specific selection, consider overloading, constraints/concepts, or `if constexpr`.

## Version

Template specialization is part of the original C++ template system; concepts and `if constexpr` provide newer alternatives for many selection problems.
