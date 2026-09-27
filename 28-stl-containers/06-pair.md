# `std::pair`

`std::pair` stores exactly two values, potentially of different types.

```cpp
std::pair<int, std::string> p{1, "Alice"};
```

## Access

```cpp
p.first;
p.second;
```

C++17 structured bindings:

```cpp
auto [id, name] = p;
```

## Factory

```cpp
auto p = std::make_pair(10, 3.14);
```

## Common Uses
- Returning two values.
- Storing key/value-like data.
- Elements returned by associative containers.
- Temporary grouping of two related values.

For example:

```cpp
std::map<int, std::string> m;
for (const auto& [key, value] : m) {
}
```

## Important

`pair` is a utility type, not a sequence container. It contains exactly two objects.
