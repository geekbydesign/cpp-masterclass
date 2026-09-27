# `std::unordered_map`

`std::unordered_map` stores key/value pairs using hashing.

```cpp
std::unordered_map<std::string, int> counts;

counts["apple"]++;
counts["banana"] = 3;
```

## Complexity

Average:
- Search: `O(1)`
- Insert: `O(1)`
- Erase: `O(1)`

Worst case:
- `O(n)`

## Important Operations

```cpp
m.find(key);
m.contains(key); // C++20
m.erase(key);
m.reserve(100);
m.rehash(100);
m.load_factor();
```

## `operator[]`

```cpp
m["apple"];
```

If the key does not exist, `operator[]` inserts it with a value-initialized mapped value.

Use `find()`/`contains()` when you do not want lookup to insert.

## `map` vs `unordered_map`

| Feature | `map` | `unordered_map` |
|---|---|---|
| Ordering | Sorted | No ordering guarantee |
| Average lookup | `O(log n)` | `O(1)` |
| Worst-case lookup | `O(log n)` | `O(n)` |
| Structure | Ordered tree | Hash table |
