# Pipe Operator

The pipe operator `|` is used to compose ranges with views and range adaptors.

```cpp
auto result =
    values
    | std::views::filter(predicate)
    | std::views::transform(transformer);
```

Read it from left to right:

```text
values
  → filter
  → transform
```

## Why `|`?

It makes a sequence of range operations resemble a data-processing pipeline.

Traditional nested style can be harder to read:

```cpp
transform(
    filter(values, predicate),
    transformer
);
```

The range pipeline is often clearer:

```cpp
values
    | filter(predicate)
    | transform(transformer);
```

## Lazy Behavior

The pipe constructs/composes views; it does not generally mean that all results are immediately computed.

## Important

The `|` syntax is specifically supported by ranges/view machinery. It should not be interpreted as a general-purpose operator for arbitrary function composition.
