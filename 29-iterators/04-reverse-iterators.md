# Reverse Iterators

Reverse iterators traverse a range in the opposite direction.

```cpp
std::vector<int> v{10, 20, 30};

for (auto it = v.rbegin(); it != v.rend(); ++it) {
    std::cout << *it;
}
```

Output:

```text
30 20 10
```

## `rbegin()` and `rend()`

- `rbegin()` refers to the last element.
- `rend()` is the past-the-end position in reverse traversal.

## `base()`

A reverse iterator has a corresponding forward iterator:

```cpp
auto rit = v.rbegin();
auto it = rit.base();
```

For a reverse iterator pointing to an element, `base()` points to the **next** element in forward direction.

Conceptually:

```text
forward:  10  20  30  end
                    ↑
                  base()

reverse:   30  20  10
            ↑
          rbegin()
```

## Important

The relationship is:

```cpp
std::next(rit.base())   // not generally the reverse element
```

More precisely, for a valid reverse iterator `rit`, the element it denotes is `*std::prev(rit.base())`.
