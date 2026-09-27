# Combining Concepts

Concepts can be composed to create stronger constraints.

## Combining with `&&`

```cpp
template <typename T>
concept Numeric =
    std::integral<T> ||
    std::floating_point<T>;

template <typename T>
concept SignedNumeric =
    Numeric<T> &&
    std::signed_integral<T>;
```

## Combining with standard concepts

```cpp
template <typename T>
concept SignedIntegral =
    std::integral<T> &&
    std::signed_integral<T>;
```

The resulting concept can be reused:

```cpp
template <SignedIntegral T>
void process(T value)
{
}
```

## Combining with custom requirements

```cpp
template <typename T>
concept SizedContainer =
    requires(T value)
    {
        value.size();
    };
```

Combine it with another concept:

```cpp
template <typename T>
concept IntegralSizedContainer =
    SizedContainer<T> &&
    requires(T value)
    {
        requires std::same_as<
            decltype(value.size()),
            std::size_t>;
    };
```

## Why compose concepts?

Instead of repeating constraints:

```cpp
std::integral<T> &&
requires(T value)
{
    value.someOperation();
}
```

you can give the requirement a meaningful name.

```cpp
template <typename T>
concept ValidType =
    std::integral<T> &&
    requires(T value)
    {
        value.someOperation();
    };
```

## Concept refinement

A more specialized concept can build on a more general one:

```cpp
template <typename T>
concept Number =
    std::integral<T> ||
    std::floating_point<T>;

template <typename T>
concept SignedNumber =
    Number<T> &&
    std::signed_integral<T>;
```

This creates a logical hierarchy of requirements.

## Interview point

Concept composition improves reuse and makes template constraints easier to understand.
