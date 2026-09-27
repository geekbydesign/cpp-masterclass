# String Size and Capacity

## `size()` and `length()`

```cpp
std::string text = "Hello";

text.size();   // 5
text.length(); // 5
```

For `std::string`, they are equivalent.

## `empty()`

```cpp
text.empty();
```

## `capacity()`

```cpp
text.capacity();
```

Capacity is storage currently available without necessarily requiring reallocation. It is not the logical length.

```text
size     -> characters currently stored
capacity -> storage currently available
```

## `reserve()`

```cpp
text.reserve(100);
```

Requests capacity for at least 100 characters.

## `shrink_to_fit()`

```cpp
text.shrink_to_fit();
```

This is a non-binding request to reduce unused capacity.

## `max_size()`

```cpp
text.max_size();
```

Returns the maximum supported string size for the implementation/allocator.

## Interview Points

- `size()` and `length()` are equivalent for `std::string`.
- `size()` is logical length.
- `capacity()` concerns allocated character storage.
- `reserve()` can reduce repeated reallocations.
- `shrink_to_fit()` is non-binding.

**Key idea:** Size and capacity are different concepts.
