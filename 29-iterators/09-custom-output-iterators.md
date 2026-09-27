# Custom Output Iterators

An output iterator is designed primarily for writing values to a destination.

Typical usage:

```cpp
*it = value;
++it;
```

Example conceptual form:

```cpp
class OutputIterator {
public:
    OutputIterator& operator++();
    OutputProxy operator*();
};
```

## Standard Example

```cpp
std::back_insert_iterator<std::vector<int>> it(v);

*it = 10;
++it;
```

Or more commonly:

```cpp
std::back_inserter(v)
```

## Characteristics
- Write-oriented.
- Forward movement.
- Generally single-pass.
- Dereferencing provides a mechanism for assignment.

## Important

Output iterators do not provide the same readable dereference semantics as normal container iterators.

They are especially useful with generic algorithms that write to an output range.
