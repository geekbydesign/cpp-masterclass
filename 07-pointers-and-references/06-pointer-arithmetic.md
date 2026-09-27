# Pointer Arithmetic

## 1. Basic Idea

```cpp
int arr[] = {10, 20, 30, 40};
int* p = arr;
```

Then:

```cpp
p + 1
```

points to the next `int`, not simply the next byte.

```cpp
*(p + 1); // 20
```

## 2. Type Matters

For:

```cpp
int* p;
```

`p + 1` advances by `sizeof(int)` bytes.

For:

```cpp
double* p;
```

`p + 1` advances by `sizeof(double)` bytes.

## 3. Valid Operations

For pointers into the same array:

```cpp
p++;
p--;
p + n;
p - n;
p1 - p2;
```

Example:

```cpp
int arr[5];

int* p1 = &arr[1];
int* p2 = &arr[4];

std::cout << p2 - p1; // 3
```

## 4. One-Past-the-End

```cpp
int* end = arr + 5;
```

Useful as an endpoint:

```cpp
for (int* p = arr; p != end; ++p)
    std::cout << *p;
```

Do not dereference `end`.

## Interview Points

- Pointer arithmetic is scaled by the pointed-to type.
- `p + 1` means the next element.
- Subtracting pointers from the same array gives element distance.
- One-past-the-end may be formed but not dereferenced.

**Key idea:** Pointer arithmetic is element-based, not byte-based.
