# Custom Random Access Iterators

A random-access iterator supports efficient arbitrary movement.

Required capabilities include:

```cpp
it + n
it - n
it += n
it -= n
it[n]
it1 - it2

it1 < it2
it1 <= it2
it1 > it2
it1 >= it2
```

## Complexity

Movement by an offset must be constant time:

```cpp
it + 1000; // O(1)
```

It must not perform 1000 individual increments.

## Example

`std::vector` and `std::deque` provide random-access iterators.

## C++20

Use:

```cpp
std::random_access_iterator<It>
```

to constrain generic code.

## Contiguous Is Stronger

A contiguous iterator additionally guarantees that iterator positions correspond to contiguous storage.

`std::vector` iterators are contiguous; `std::deque` iterators are random-access but not contiguous.
