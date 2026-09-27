# Custom Input Iterators

An input iterator is used to read elements while moving forward through a range.

Typical operations:

```cpp
*it
++it
it == end
it != end
```

Example conceptual iterator:

```cpp
class InputIterator {
public:
    const T& operator*() const;
    InputIterator& operator++();

    bool operator==(const InputIterator& other) const;
};
```

## Characteristics
- Single-pass semantics.
- Supports reading values.
- Moves forward.
- Does not require random access.

## Example Use

Input iterators are useful for sources such as:
- Streams.
- Generated sequences.
- Single-pass input devices.

`std::istream_iterator<T>` is a standard example.

## Important

Do not assume that copying an input iterator gives two independent iterators that can be traversed repeatedly. Input iterators are generally single-pass.
