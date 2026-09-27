# `std::deque`

`std::deque` is a double-ended sequence container.

```cpp
std::deque<int> d{20, 30};
d.push_front(10);
d.push_back(40);
```

## Key Properties
- Efficient insertion/removal at both ends.
- Random access: `O(1)`.
- Not required to use contiguous storage.
- Usually implemented using multiple memory blocks.

## Complexity

| Operation | Typical complexity |
|---|---|
| `push_front` | `O(1)` amortized |
| `push_back` | `O(1)` amortized |
| `pop_front` | `O(1)` |
| `pop_back` | `O(1)` |
| Random access | `O(1)` |
| Middle insertion | `O(n)` |

## `vector` vs `deque`

| Feature | `vector` | `deque` |
|---|---|---|
| Contiguous | Yes | No |
| Front insertion | `O(n)` | `O(1)` |
| Back insertion | Amortized `O(1)` | Amortized `O(1)` |
| Random access | Yes | Yes |

Use `deque` when efficient operations at both ends are important.
