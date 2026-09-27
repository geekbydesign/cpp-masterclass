# `std::forward_list`

`std::forward_list` is a singly linked list.

```cpp
std::forward_list<int> f{10, 20, 30};
```

## Key Properties
- Forward iteration only.
- No random access.
- Efficient insertion/removal after a known position.
- Lower per-node overhead than a doubly linked list.
- No `size()` member.

## Example

```cpp
auto it = f.before_begin();
f.insert_after(it, 5);
```

## Complexity

| Operation | Complexity |
|---|---|
| Insert after known position | `O(1)` |
| Erase after known position | `O(1)` |
| Search | `O(n)` |
| Random access | Not supported |

## Why `before_begin()`?

Because insertion/removal at the front and operations involving the first element need a position before the first node.

## Use When

You need singly linked-list behavior and memory/structural simplicity matters more than random access.
