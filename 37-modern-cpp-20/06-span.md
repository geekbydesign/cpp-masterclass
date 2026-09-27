# `std::span`

C++20 introduced `std::span`, a non-owning view over a contiguous sequence of objects.

Header:

```cpp
#include <span>
```

## Basic Example

```cpp
void process(std::span<int> values)
{
    for (int& value : values)
        value *= 2;
}
```

It can accept a contiguous sequence such as:

```cpp
std::vector<int> values{1, 2, 3};

process(values);
```

and an array:

```cpp
int values[] = {1, 2, 3};

process(values);
```

## No Ownership

`std::span` does not own the elements.

```text
vector/array
    ↓
 owns data

span
    ↓
 views data
```

## Dynamic Extent

```cpp
std::span<int> values;
```

The number of elements is determined at runtime.

## Static Extent

```cpp
std::span<int, 3> values;
```

The extent is part of the type.

## Useful Operations

```cpp
values.size();
values.empty();
values.front();
values.back();
values[0];
values.data();
values.subspan(...);
```

## Lifetime

The referenced data must remain alive:

```cpp
std::span<int> makeSpan()
{
    std::vector<int> values{1, 2, 3};
    return values; // dangling span
}
```

## `span` vs `string_view`

```text
span<T>
→ contiguous sequence of T

string_view
→ non-owning character sequence
```

## Interview Point

`std::span` is useful for accepting arrays/buffers without copying or requiring a specific owning container type.
