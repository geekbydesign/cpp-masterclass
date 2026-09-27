# Array Size

## 1. `sizeof` for C-Style Arrays

For an actual array:

```cpp
int arr[] = {10, 20, 30, 40, 50};

std::size_t size = sizeof(arr) / sizeof(arr[0]);
```

If `int` is 4 bytes:

```text
sizeof(arr)    = 20
sizeof(arr[0]) = 4
20 / 4         = 5
```

## 2. `std::size`

In C++17:

```cpp
#include <iterator>

int arr[] = {10, 20, 30, 40, 50};

std::size_t size = std::size(arr);
```

This is clearer than the `sizeof` calculation.

## 3. Important: Array vs Pointer

```cpp
int arr[5];

std::cout << sizeof(arr);
```

Here `sizeof(arr)` gives the size of the **whole array**.

But:

```cpp
int* ptr = arr;

std::cout << sizeof(ptr);
```

Now `sizeof(ptr)` gives the size of the **pointer**, not the array.

## 4. Example

```cpp
int arr[10];

std::cout << sizeof(arr) / sizeof(arr[0]);
```

Output:

```text
10
```

## 5. Interview Trap

Do not assume this works after passing an array to a normal function:

```cpp
void printSize(int arr[])
{
    // arr is treated as a pointer here
}
```

Inside the function, `sizeof(arr)` gives the pointer size.

## Quick Revision

```cpp
int arr[] = {1, 2, 3, 4};

sizeof(arr) / sizeof(arr[0]);
std::size(arr);
```

Prefer `std::size(arr)` when available.

**Key idea:** `sizeof` knows the full array size only while the object is still an array, not after it has decayed to a pointer.
