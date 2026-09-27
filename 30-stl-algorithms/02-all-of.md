# `std::all_of`

`std::all_of` checks whether every element in a range satisfies a predicate.

```cpp
std::vector<int> v{2, 4, 6, 8};

bool result = std::all_of(
    v.begin(),
    v.end(),
    [](int x) {
        return x % 2 == 0;
    }
);
```

`result` is `true` because every element is even.

## Signature

Conceptually:

```cpp
std::all_of(first, last, predicate);
```

## Short-Circuiting

The algorithm stops as soon as the predicate returns `false`.

```text
element 1 → true
element 2 → true
element 3 → false
             ↓
           stop
```

If the range is empty, `all_of` returns `true`.

## Complexity

At most `O(n)` predicate applications.

## C++20

```cpp
std::ranges::all_of(v, predicate);
```

## Related Algorithms

```cpp
std::all_of(...)
std::any_of(...)
std::none_of(...)
```
