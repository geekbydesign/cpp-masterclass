# Raw Pointers as Iterators

Raw pointers can satisfy iterator requirements for contiguous arrays.

```cpp
int a[] = {10, 20, 30};

int* first = a;
int* last = a + 3;

for (auto it = first; it != last; ++it) {
    std::cout << *it;
}
```

## Why?

Pointers support:

```cpp
*ptr
++ptr
--ptr
ptr + n
ptr - n
ptr1 - ptr2
ptr1 < ptr2
```

for elements within the same array.

Therefore, pointers can model random-access and contiguous iterator behavior for arrays.

## `std::begin`

```cpp
auto first = std::begin(a);
auto last = std::end(a);
```

This is usually clearer for generic code.

## Important

Pointer arithmetic is only valid within the appropriate array/object bounds. The one-past-the-end pointer may be formed and compared, but must not be dereferenced.
