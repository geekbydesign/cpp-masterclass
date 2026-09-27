# Ranges with Iterators

Ranges build on the iterator model rather than replacing it.

A range generally provides:

```cpp
std::ranges::begin(r);
std::ranges::end(r);
```

Algorithms can then operate on those positions.

## Iterator and Sentinel

Traditional code often assumes:

```cpp
Iterator first;
Iterator last;
```

Ranges allow:

```text
iterator
sentinel
```

where the sentinel marks the end but does not necessarily have the same type as the iterator.

## Example

```cpp
auto first = std::ranges::begin(v);
auto last  = std::ranges::end(v);

while (first != last) {
    std::cout << *first;
    ++first;
}
```

## Range-Based `for`

Range-based `for` is also based on beginning/end operations:

```cpp
for (auto& value : v) {
    // ...
}
```

## Important

A range does not necessarily own its elements.

A view commonly refers to another range, so the lifetime of the underlying data matters.
