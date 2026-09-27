# `std::set`

`std::set` stores unique keys in sorted order.

```cpp
std::set<int> s{30, 10, 20, 20};
```

Result:

```text
10 20 30
```

## Key Properties
- Unique keys.
- Sorted according to a comparator.
- Search/insert/erase: `O(log n)`.
- Iteration is ordered.

## Common Operations

```cpp
s.insert(10);
s.erase(10);
s.find(20);
s.contains(20); // C++20
s.count(20);
```

## Example

```cpp
if (s.find(10) != s.end()) {
}
```

## Important

Elements are effectively immutable through set iterators because changing a key could violate the container's ordering.

## Use When

You need:
- Unique values.
- Sorted order.
- Logarithmic lookup.
