# `std::max_element` and `std::min_element`

These algorithms return an iterator to the largest or smallest element in a range.

```cpp
std::vector<int> v{30, 10, 50, 20};

auto maxIt = std::max_element(v.begin(), v.end());
auto minIt = std::min_element(v.begin(), v.end());
```

Access:

```cpp
std::cout << *maxIt;
std::cout << *minIt;
```

## Custom Comparison

```cpp
auto it = std::max_element(
    v.begin(),
    v.end(),
    [](int a, int b) {
        return a < b;
    }
);
```

The comparison determines ordering.

## Empty Range

For an empty range:

```cpp
it == v.end()
```

so never dereference the result without checking.

## Complexity

Both algorithms are linear:

```text
O(n)
```

## Related

```cpp
std::minmax_element(...)
```

returns both minimum and maximum iterators in one algorithm call.

## C++20

```cpp
std::ranges::max_element(v);
std::ranges::min_element(v);
```
