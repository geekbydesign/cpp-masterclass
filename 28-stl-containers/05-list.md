# `std::list`

`std::list` is a doubly linked list.

```cpp
std::list<int> l{10, 20, 30};
```

## Key Properties
- Bidirectional iteration.
- No random access.
- Insert/erase at a known position: `O(1)`.
- Each element is stored in a separate node.
- Stable element addresses across many insert/erase operations.

## Example

```cpp
auto it = std::next(l.begin());
l.insert(it, 15);
```

## Complexity

| Operation | Complexity |
|---|---|
| Insert at known position | `O(1)` |
| Erase at known position | `O(1)` |
| Search | `O(n)` |
| Random access | Not supported |

## Important

Finding the position is often `O(n)`, even though insertion at that position is `O(1)`.

## `list` vs `vector`

Do not choose `list` simply because insertion is `O(1)`. In many real programs, `vector` performs better because of contiguous storage and cache locality.
