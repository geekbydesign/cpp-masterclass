# `std::vector`

`std::vector` is a dynamically sized contiguous sequence container.

```cpp
std::vector<int> v{10, 20, 30};
v.push_back(40);
```

## Key Properties
- Contiguous memory.
- Random access: `O(1)`.
- `push_back()` / `emplace_back()` amortized `O(1)`.
- Insert/erase in the middle: `O(n)`.
- Excellent cache locality.
- Automatically manages memory.

## Common Operations

```cpp
v.push_back(10);
v.emplace_back(20);
v.pop_back();
v.size();
v.empty();
v.front();
v.back();
v[0];
v.at(0);
v.clear();
v.reserve(100);
v.capacity();
```

## `size()` vs `capacity()`

- `size()` → number of elements.
- `capacity()` → elements that can fit without reallocation.

`reserve()` changes capacity, not size.

## Reallocation

When capacity is insufficient, the vector may allocate a new buffer and move/copy elements.

Reallocation invalidates pointers, references, and iterators to elements.

## Interview Tip

Use `vector` as the default sequence container unless another container has a specific advantage.
