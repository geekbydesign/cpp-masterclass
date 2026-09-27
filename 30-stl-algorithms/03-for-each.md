# `std::for_each`

`std::for_each` applies a callable to every element in a range.

```cpp
std::vector<int> v{1, 2, 3};

std::for_each(
    v.begin(),
    v.end(),
    [](int& x) {
        x *= 2;
    }
);
```

Result:

```text
2 4 6
```

## Callable

The third argument can be:
- Lambda.
- Function pointer.
- Function object.
- Other callable object.

## Modifying Elements

Use a reference when modification is required:

```cpp
[](int& x) {
    x *= 2;
}
```

Without a reference:

```cpp
[](int x) {
    x *= 2; // modifies only the copy
}
```

## Complexity

Exactly `n` applications for a range of `n` elements.

## Return Value

`std::for_each` returns the callable object after processing.

This can matter for stateful function objects.

## C++20

```cpp
std::ranges::for_each(v, callable);
```
