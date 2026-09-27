# `std::copy`

`std::copy` copies elements from one range into an output range.

```cpp
std::vector<int> source{1, 2, 3};
std::vector<int> destination(3);

std::copy(
    source.begin(),
    source.end(),
    destination.begin()
);
```

## Important

The destination must have enough valid output positions.

This is correct:

```cpp
std::vector<int> destination(3);
```

This is not:

```cpp
std::vector<int> destination;
std::copy(
    source.begin(),
    source.end(),
    destination.begin()
); // invalid: destination has no elements
```

For insertion into a vector, use an inserter:

```cpp
std::copy(
    source.begin(),
    source.end(),
    std::back_inserter(destination)
);
```

## Complexity

Linear:

```text
O(n)
```

## Related

```cpp
std::copy_if(...)
std::copy_n(...)
std::copy_backward(...)
```

## C++20

```cpp
std::ranges::copy(source, destination.begin());
```
