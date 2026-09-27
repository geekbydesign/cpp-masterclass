# Conjunction and Disjunction

Concept constraints can use logical operators.

## Conjunction: `&&`

`&&` means **all requirements must be satisfied**.

```cpp
template <typename T>
concept SignedIntegral =
    std::integral<T> &&
    std::signed_integral<T>;
```

A type must satisfy both concepts.

## Disjunction: `||`

`||` means **at least one requirement must be satisfied**.

```cpp
template <typename T>
concept Number =
    std::integral<T> ||
    std::floating_point<T>;
```

This accepts either integral or floating-point types.

## Negation: `!`

Constraints can also be negated:

```cpp
template <typename T>
concept NotPointer = !std::is_pointer_v<T>;
```

## Combining all three

```cpp
template <typename T>
concept Valid =
    (std::integral<T> || std::floating_point<T>) &&
    (!std::same_as<T, bool>);
```

## Short-circuiting

Constraint expressions have logical semantics, and constraint checking can avoid evaluating later requirements when an earlier requirement already determines the result.

This is useful when a later requirement depends on the earlier one.

## Example

```cpp
template <typename T>
concept HasValueType =
    requires
    {
        typename T::value_type;
    };

template <typename T>
concept ValidContainer =
    HasValueType<T> &&
    requires(T value)
    {
        value.begin();
        value.end();
    };
```

## Interview checklist

```text
A && B
→ A and B required

A || B
→ A or B required

!A
→ A must not be satisfied
```

These operators allow simple concepts to be combined into more expressive constraints.
