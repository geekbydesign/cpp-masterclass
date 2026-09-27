# Custom Bidirectional Iterators

A bidirectional iterator supports both forward and backward traversal.

In addition to forward operations:

```cpp
++it;
```

it supports:

```cpp
--it;
```

Conceptual interface:

```cpp
class Iterator {
public:
    T& operator*() const;

    Iterator& operator++();
    Iterator& operator--();

    bool operator==(const Iterator&) const;
};
```

## Example

`std::list` provides bidirectional iterators.

## Complexity

For a proper bidirectional iterator:

```cpp
++it; // O(1)
--it; // O(1)
```

It does not support:

```cpp
it + 5
it[5]
```

because those require random-access capabilities.

## C++20

```cpp
std::bidirectional_iterator<It>
```

can express the requirement directly.
