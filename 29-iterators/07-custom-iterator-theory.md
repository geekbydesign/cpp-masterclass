# Custom Iterator Theory

A custom iterator is a type that models the operations required by an iterator category.

Conceptually, an iterator needs:
- A way to access the current element.
- A way to move through the range.
- A way to compare positions.
- Appropriate iterator traits/concepts.

Example skeleton:

```cpp
class Iterator {
public:
    T& operator*() const;
    Iterator& operator++();
    bool operator==(const Iterator& other) const;
};
```

## Typical Iterator Interface

Depending on the category, an iterator may implement:

```cpp
operator*
operator->
operator++
operator--
operator+
operator-
operator+=
operator-=
operator[]
operator==
operator!=
```

## Important Design Questions

When implementing an iterator, define:
1. What does one iterator position represent?
2. How is the next position reached?
3. What does dereferencing return?
4. How is the end represented?
5. Which iterator category is actually supported?
6. What invalidates the iterator?

## C++20

Modern code can express iterator requirements using concepts rather than relying only on legacy category tags.
