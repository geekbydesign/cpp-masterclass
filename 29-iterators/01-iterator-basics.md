# Iterator Basics

An iterator is an object that provides a way to traverse elements of a container or another range.

```cpp
std::vector<int> v{10, 20, 30};

auto it = v.begin();

std::cout << *it; // 10

++it;
std::cout << *it; // 20
```

## Core Operations

Common iterator operations include:

```cpp
*it        // access element
++it       // move forward
it == end  // compare
```

The exact operations available depend on the iterator category.

## `begin()` and `end()`

```cpp
auto first = v.begin();
auto last  = v.end();
```

- `begin()` refers to the first element.
- `end()` is a **past-the-end** iterator.
- `end()` must not be dereferenced.

Typical traversal:

```cpp
for (auto it = v.begin(); it != v.end(); ++it) {
    std::cout << *it;
}
```

## Important

An iterator is not necessarily a pointer, although raw pointers can act as iterators for arrays.
