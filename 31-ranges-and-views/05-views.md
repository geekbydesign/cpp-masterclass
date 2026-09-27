# Views

A view is a lightweight object representing a range without necessarily creating or storing a separate sequence of results.

```cpp
std::vector<int> v{1, 2, 3, 4, 5};

auto even = v | std::views::filter(
    [](int x) {
        return x % 2 == 0;
    }
);
```

## Lazy Evaluation

Views are generally lazy.

The filtering work happens as the view is iterated:

```cpp
for (int x : even) {
    std::cout << x;
}
```

Creating the view does not normally create a new vector containing the even values.

## Non-Owning Nature

Many views refer to an underlying range.

```cpp
auto view = v | std::views::filter(...);
```

The vector `v` must remain alive while the view is used.

## Benefits
- Avoid unnecessary intermediate containers.
- Compose operations.
- Process potentially large or infinite sequences.
- Express transformations declaratively.

## Important

A view is not automatically a container.

If you need stored results, materialize them into a container explicitly.
