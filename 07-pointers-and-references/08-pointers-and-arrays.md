# Pointers and Arrays

## 1. Array-to-Pointer Decay

```cpp
int arr[5] = {10, 20, 30, 40, 50};
int* p = arr;
```

In many expressions, `arr` converts to a pointer to its first element.

## 2. Indexing

These are equivalent:

```cpp
arr[i]
```

```cpp
*(arr + i)
```

Example:

```cpp
std::cout << arr[2];
std::cout << *(arr + 2);
```

Both access `30`.

## 3. Pointer Traversal

```cpp
for (int* p = arr; p != arr + 5; ++p)
{
    std::cout << *p;
}
```

## 4. `arr` vs `&arr`

For:

```cpp
int arr[5];
```

- `arr` commonly decays to `int*`.
- `&arr[0]` has type `int*`.
- `&arr` has type `int (*)[5]`.

The last is a pointer to the entire array.

## 5. Pointer to Array

```cpp
int arr[5];

int (*p)[5] = &arr;

std::cout << (*p)[2];
```

## 6. Important Rule

An array is **not** a pointer.

Array-to-pointer conversion happens in many expressions, but not all:

```cpp
sizeof(arr)
&arr
```

keep the array type involved.

## Interview Points

Know:

```cpp
arr[i] == *(arr + i)
```

and:

```cpp
int* p;       // pointer to int
int (*p)[5];  // pointer to array of 5 int
```

**Key idea:** Arrays and pointers work closely together, but they are different types.
