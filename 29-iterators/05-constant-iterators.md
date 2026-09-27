# Constant Iterators

A const iterator prevents modification of the element through that iterator.

```cpp
std::vector<int> v{10, 20, 30};

for (auto it = v.cbegin(); it != v.cend(); ++it) {
    // *it = 100; // error
}
```

## `cbegin()` / `cend()`

```cpp
auto it = v.cbegin();
auto end = v.cend();
```

They provide const access.

## `const_iterator`

```cpp
std::vector<int>::const_iterator it;
```

## `const` Container

For a const container:

```cpp
const std::vector<int> v{10, 20, 30};

auto it = v.begin();
```

`it` is a const iterator because the container itself is const.

## Important Distinction

```cpp
const auto it = v.begin();
```

means the **iterator object** cannot be changed.

It does not necessarily make the pointed-to element const.

To prevent modifying the element, use a `const_iterator`.
