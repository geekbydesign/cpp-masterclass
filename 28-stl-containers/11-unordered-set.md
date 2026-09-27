# `std::unordered_set`

`std::unordered_set` stores unique keys using hashing.

```cpp
std::unordered_set<int> s{10, 20, 30};
```

## Key Properties
- Unique keys.
- No sorted-order guarantee.
- Average search/insert/erase: `O(1)`.
- Worst case: `O(n)`.
- Hash-table based.

## Common Operations

```cpp
s.insert(10);
s.erase(10);
s.find(20);
s.contains(20); // C++20
```

## Buckets

```cpp
s.bucket_count();
s.load_factor();
s.max_load_factor();
s.rehash(100);
```

## `set` vs `unordered_set`

| Feature | `set` | `unordered_set` |
|---|---|---|
| Ordering | Sorted | No ordering guarantee |
| Average lookup | `O(log n)` | `O(1)` |
| Worst-case lookup | `O(log n)` | `O(n)` |
| Main structure | Ordered tree | Hash table |

Use `unordered_set` when ordering is unnecessary and hash-based lookup is appropriate.
