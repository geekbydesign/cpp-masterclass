# Iterator Types

C++ defines iterator categories based on the operations they support.

## Categories

```text
Input
  ↓
Forward
  ↓
Bidirectional
  ↓
Random Access
  ↓
Contiguous
```

There is also an **Output Iterator**, which is primarily a write-oriented category.

| Category | Main capability |
|---|---|
| Input | Read, move forward |
| Output | Write, move forward |
| Forward | Read/write as applicable, multi-pass, forward |
| Bidirectional | Forward + backward |
| Random access | Bidirectional + jumps/arithmetic |
| Contiguous | Random access + contiguous storage |

## Examples

- `std::vector` → contiguous iterators.
- `std::deque` → random-access iterators.
- `std::list` → bidirectional iterators.
- `std::forward_list` → forward iterators.
- `std::istream_iterator` → input iterator.
- `std::ostream_iterator` → output iterator.

## C++20

Iterator concepts such as:

```cpp
std::input_iterator
std::forward_iterator
std::bidirectional_iterator
std::random_access_iterator
std::contiguous_iterator
```

provide compile-time constraints for iterator-based code.
