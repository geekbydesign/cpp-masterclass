# Strong, Weak, and Partial Ordering

C++20 comparison categories describe how completely two values can be ordered.

The three main categories are:

```cpp
std::strong_ordering
std::weak_ordering
std::partial_ordering
```

## Strong Ordering

Represents a strict total ordering where equivalent values are interchangeable for comparison purposes.

Example:

```cpp
int a = 10;
int b = 20;

auto result = a <=> b;
```

The result can be:

```cpp
std::strong_ordering::less
std::strong_ordering::equal
std::strong_ordering::greater
```

## Weak Ordering

Values can be equivalent for ordering purposes without necessarily being identical in all relevant aspects.

A classic conceptual example is case-insensitive strings:

```text
"abc"
"ABC"
```

They may be equivalent under the chosen ordering while still being different strings.

## Partial Ordering

Some values may be unordered relative to each other.

Floating-point NaN is the classic example.

```cpp
double a = 1.0;
double b = std::numeric_limits<double>::quiet_NaN();

auto result = a <=> b;
```

The result can be:

```cpp
std::partial_ordering::unordered
```

## Comparison Categories

```text
strong_ordering
    -> less / equal / greater

weak_ordering
    -> less / equivalent / greater

partial_ordering
    -> less / equivalent / greater / unordered
```

## Important

The comparison category communicates the mathematical properties guaranteed by the comparison.

## Interview Tip

Remember:

```text
strong -> strongest ordering guarantees
weak   -> equivalence can group distinct values
partial -> some values can be unordered
```
