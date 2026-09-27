# Wrapping Other Iterators

An iterator can wrap another iterator to add behavior while preserving traversal.

Conceptually:

```cpp
template <typename Iterator>
class LoggingIterator {
    Iterator current;

public:
    decltype(auto) operator*() const {
        return *current;
    }

    LoggingIterator& operator++() {
        ++current;
        return *this;
    }
};
```

The wrapper forwards operations to the underlying iterator.

## Common Uses
- Logging.
- Filtering or adapting access.
- Transforming values.
- Adding validation.
- Instrumentation.
- Adapting legacy APIs.

## Important Design Principle

A wrapper should preserve the capabilities of the underlying iterator when possible.

If the underlying iterator is random access but the wrapper only implements `++`, the wrapper no longer provides random-access operations.

## Modern C++

The standard library's iterator/range facilities already provide many adapters, and C++20 ranges provide powerful view-based composition.

## Interview Point

When writing a custom iterator wrapper, think in terms of **capability preservation**:

```text
underlying iterator
        ↓
wrapper operations
        ↓
same or intentionally reduced iterator category
```
