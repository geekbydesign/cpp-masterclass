# Arrays and Pointers

## 1. Array-to-Pointer Decay

Given:

```cpp
int arr[5] = {10, 20, 30, 40, 50};
```

In many expressions, `arr` automatically converts to a pointer to its first element:

```cpp
int* ptr = arr;
```

So:

```cpp
ptr == &arr[0]
```

## 2. Access Through Pointer

```cpp
std::cout << *ptr;      // 10
std::cout << *(ptr + 1); // 20
```

Pointer arithmetic moves by the size of the pointed-to type.

## 3. `arr[i]` and Pointer Arithmetic

These are equivalent:

```cpp
arr[i]
```

and:

```cpp
*(arr + i)
```

Also:

```cpp
i[arr]
```

is valid because:

```cpp
i[arr] == *(i + arr)
```

But `arr[i]` should be preferred for readability.

## 4. Array Address vs First Element Address

```cpp
int arr[5];

arr       // usually converts to int*
&arr[0]   // int*
&arr      // pointer to the entire array: int (*)[5]
```

`arr` and `&arr` may have the same numerical address but different types.

## 5. Pointer Arithmetic

```cpp
int* ptr = arr;

++ptr; // points to arr[1]
++ptr; // points to arr[2]
```

Valid pointer arithmetic is within the same array object (or one-past-the-end for forming/comparing the pointer).

## 6. One-Past-the-End

```cpp
int* end = arr + 5;
```

`end` may be used as an endpoint, but must not be dereferenced.

```cpp
// *end; // invalid
```

## Interview Trap

Arrays and pointers are related, but they are **not the same type**.

```cpp
int arr[5];
int* ptr = arr;
```

`arr` is an array object. `ptr` is a pointer object.

## Quick Revision

```cpp
arr[i] == *(arr + i)
```

**Key idea:** Arrays often decay to pointers, but an array itself is not a pointer.
