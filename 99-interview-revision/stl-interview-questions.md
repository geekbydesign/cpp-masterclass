# STL Interview Questions

## 1. What is the STL?

The Standard Template Library broadly provides:
- Containers.
- Iterators.
- Algorithms.
- Function objects/utilities.

Modern C++ also includes ranges and many additional library abstractions.

## 2. `vector` vs `list`?

```text
vector
→ contiguous
→ random access
→ excellent cache locality
→ efficient append at end

list
→ linked nodes
→ no random access
→ stable node references under many operations
```

Do not choose `list` merely because insertion is O(1).

## 3. `vector` vs `deque`?

```text
vector → contiguous storage
deque  → segmented storage
```

`deque` supports efficient insertion/removal at both ends.

## 4. `map` vs `unordered_map`?

```text
map
→ ordered
→ typically balanced tree
→ O(log n) search

unordered_map
→ hash table
→ average O(1) lookup
→ no ordering guarantee
```

Actual complexity and implementation details should be understood in context.

## 5. `set` vs `unordered_set`?

Same fundamental distinction:

```text
set           → ordered unique keys
unordered_set → hashed unique keys
```

## 6. What is iterator invalidation?

Operations on containers can invalidate iterators/references/pointers to elements.

Rules differ by container and operation.

Always check the specific container's invalidation rules.

## 7. What is a random-access iterator?

Supports operations such as:

```cpp
it + n
it - n
it[n]
it2 - it1
```

## 8. What is a range?

An abstraction representing something that can be iterated.

C++20 ranges algorithms operate directly on ranges:

```cpp
std::ranges::sort(values);
```

## 9. What is `priority_queue`?

A container adaptor providing access to the highest-priority element according to its comparator.

Default is max-heap behavior.

## 10. What is `emplace_back`?

Constructs an element in place at the end of a container.

```cpp
values.emplace_back(args...);
```

It does not universally guarantee better performance than `push_back`; understand the actual construction/move behavior.

## 11. What is `reserve`?

Preallocates capacity without changing the container's size.

```cpp
values.reserve(100);
```

## 12. `size()` vs `capacity()`?

```text
size     → number of elements
capacity → number of elements that can be stored without reallocation
```

## 13. What is `std::move` with containers?

It can transfer the resources of a movable container:

```cpp
std::vector<int> b = std::move(a);
```

## 14. What are algorithms?

Reusable generic operations such as:

```cpp
std::sort
std::find
std::copy
std::transform
```

## 15. Why use algorithms instead of handwritten loops?

They improve reuse, express intent, and integrate with iterator/range abstractions.

## 16. What are ranges/views?

C++20 ranges provide composable algorithms and lazy views.

```cpp
auto result =
    values
    | std::views::filter(predicate)
    | std::views::transform(transform);
```

## 17. `string` vs `string_view`?

```text
string      → owns character data
string_view → non-owning view
```

## 18. `array` vs C-style array?

`std::array<T, N>` is a standard-library container with value semantics and useful STL integration while still storing elements contiguously.

## 19. What is `unordered_map` worst-case complexity?

Lookup is average O(1), but worst-case can degrade to O(n).

## 20. What should determine container choice?

Consider:
- Ownership.
- Access pattern.
- Insertion/removal pattern.
- Ordering.
- Memory layout/cache behavior.
- Iterator/reference invalidation.
- Complexity requirements.
