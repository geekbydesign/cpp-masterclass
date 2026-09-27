# `std::multimap`

`std::multimap` stores key/value pairs in sorted key order and allows duplicate keys.

```cpp
std::multimap<int, std::string> mm;

mm.emplace(1, "Alice");
mm.emplace(1, "Bob");
```

Both entries can have key `1`.

## Lookup

```cpp
auto range = mm.equal_range(1);

for (auto it = range.first; it != range.second; ++it) {
    std::cout << it->second;
}
```

C++20:

```cpp
auto [first, last] = mm.equal_range(1);
```

## Complexity

- Search: `O(log n)`
- Insert: `O(log n)`
- Erase by iterator: amortized constant.
- Erase by key: logarithmic plus number erased.

## Important

Unlike `std::map`, `multimap` does not provide `operator[]` because a key can correspond to multiple values.
