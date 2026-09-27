# `std::map`

`std::map` stores key/value pairs with unique keys in sorted key order.

```cpp
std::map<int, std::string> m;

m[1] = "One";
m[2] = "Two";
```

## Complexity

| Operation | Complexity |
|---|---|
| Search | `O(log n)` |
| Insert | `O(log n)` |
| Erase | `O(log n)` |

## Access

```cpp
m[1];
m.at(1);
m.find(1);
m.contains(1); // C++20
```

### Important Difference

`operator[]` inserts a default-initialized mapped value when the key does not exist.

`at()` throws `std::out_of_range` when the key does not exist.

## Iteration

```cpp
for (const auto& [key, value] : m) {
    std::cout << key << ' ' << value;
}
```

Keys are visited in sorted order.

## Use When

You need unique keys plus ordered/logarithmic lookup.
