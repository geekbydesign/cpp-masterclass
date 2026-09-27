# View Composition

Views become powerful when multiple operations are composed.

```cpp
auto result =
    v
    | std::views::filter([](int x) {
          return x % 2 == 0;
      })
    | std::views::transform([](int x) {
          return x * 10;
      })
    | std::views::take(3);
```

Conceptually:

```text
input
  ↓
filter
  ↓
transform
  ↓
take
  ↓
result
```

## Lazy Pipeline

The operations are normally evaluated as elements are requested.

The program does not need to first build:

```text
filtered vector
    ↓
transformed vector
    ↓
final vector
```

Instead, the pipeline can process values on demand.

## Benefits
- Less temporary storage.
- Clear data-processing flow.
- Easy composition.
- Can terminate early.

## Important

The capabilities and complexity of the final view depend on the underlying range and the adaptors used.

Not every composed view supports random access or common-range behavior.
