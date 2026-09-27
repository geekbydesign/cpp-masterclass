# `std::sort`

`std::sort` rearranges elements into sorted order.

```cpp
std::vector<int> v{40, 10, 30, 20};

std::sort(v.begin(), v.end());
```

Result:

```text
10 20 30 40
```

## Descending Order

```cpp
std::sort(
    v.begin(),
    v.end(),
    std::greater<int>{}
);
```

## Custom Comparator

```cpp
std::sort(
    v.begin(),
    v.end(),
    [](int a, int b) {
        return a > b;
    }
);
```

The comparator must define a valid strict weak ordering.

## Complexity

Typical/required complexity:

```text
O(n log n)
```

`std::sort` requires random-access iterators.

## Stability

`std::sort` is **not stable**.

If equivalent elements must preserve their relative order, use:

```cpp
std::stable_sort(...)
```

## C++20

```cpp
std::ranges::sort(v);
```

## Interview Tip

Know the difference:

```text
sort        → not stable
stable_sort → preserves relative order of equivalent elements
```
