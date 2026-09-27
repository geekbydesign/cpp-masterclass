# `std::multiset`

`std::multiset` stores elements in sorted order and allows duplicate keys.

```cpp
std::multiset<int> ms{10, 20, 10, 30};
```

Contents:

```text
10 10 20 30
```

## Complexity

- Search: `O(log n)`
- Insert: `O(log n)`
- Erase by iterator: amortized constant after locating the iterator.
- Erase by key: logarithmic plus number of erased elements.

## Duplicate Values

```cpp
ms.insert(10);
ms.insert(10);

std::cout << ms.count(10);
```

## `set` vs `multiset`

| Feature | `set` | `multiset` |
|---|---|---|
| Sorted | Yes | Yes |
| Duplicate keys | No | Yes |
| Lookup | `O(log n)` | `O(log n)` |

Use `multiset` when sorted order is required and duplicates must be preserved.
