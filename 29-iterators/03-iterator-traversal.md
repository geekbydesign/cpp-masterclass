# Iterator Traversal

The basic traversal pattern is:

```cpp
for (auto it = container.begin();
     it != container.end();
     ++it)
{
    std::cout << *it;
}
```

## Forward Traversal

```cpp
++it;
```

Supported by all standard iterator categories except special output-only semantics.

## Backward Traversal

```cpp
--it;
```

Requires at least a bidirectional iterator.

## Random Access

Random-access iterators support:

```cpp
it + n;
it - n;
it += n;
it -= n;

it[n];
it1 - it2;

it1 < it2;
```

## Generic Traversal

Do not assume random access:

```cpp
std::advance(it, n);
```

`std::advance` uses the capabilities of the iterator:
- Increment repeatedly for weaker iterators.
- More efficient movement for stronger iterators.

## Interview Tip

Writing generic iterator code means relying only on operations guaranteed by the iterator category you require.
