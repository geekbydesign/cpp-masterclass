# Custom Forward Iterators

A forward iterator supports repeated traversal in the forward direction.

Compared with an input iterator, it has **multi-pass** semantics.

Conceptually:

```cpp
class ForwardIterator {
public:
    T& operator*() const;
    ForwardIterator& operator++();

    bool operator==(const ForwardIterator&) const;
};
```

## Characteristics
- Forward movement.
- Multi-pass.
- Can read and, where appropriate, modify elements.
- Can be copied and compared.
- Two copies can independently traverse the same range.

## Example Containers

`std::forward_list` provides forward iterators.

## C++20 Concept

```cpp
std::forward_iterator<It>
```

can be used to constrain a template.

## Key Difference

```text
Input iterator   → single-pass
Forward iterator → multi-pass
```
