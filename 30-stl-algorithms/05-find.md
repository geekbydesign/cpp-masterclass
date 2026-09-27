# `std::find`

`std::find` searches a range for a value and returns an iterator to the first matching element.

```cpp
std::vector<int> v{10, 20, 30, 20};

auto it = std::find(v.begin(), v.end(), 20);
```

The iterator points to the first `20`.

## Check for Failure

```cpp
if (it != v.end()) {
    std::cout << *it;
}
```

If no element matches:

```cpp
it == v.end()
```

## Complexity

Linear:

```text
O(n)
```

In the worst case, every element is examined.

## Related Algorithms

### `find_if`

Search using a predicate:

```cpp
auto it = std::find_if(
    v.begin(),
    v.end(),
    [](int x) {
        return x > 25;
    }
);
```

### `find_if_not`

Find the first element for which the predicate is false.

## C++20

```cpp
std::ranges::find(v, 20);
std::ranges::find_if(v, predicate);
```
