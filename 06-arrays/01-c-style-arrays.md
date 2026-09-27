# C-Style Arrays

## 1. What is an Array?

A C-style array stores a fixed number of elements of the **same type** in contiguous memory.

```cpp
int numbers[5];
```

Conceptually:

```text
numbers
  |
  v
+----+----+----+----+----+
| 10 | 20 | 30 | 40 | 50 |
+----+----+----+----+----+
  0    1    2    3    4
```

## 2. Important Properties

- Fixed size after creation.
- All elements have the same type.
- Elements are stored contiguously.
- Indexing starts at `0`.
- Valid indices for `int arr[5]` are `0` through `4`.
- No automatic bounds checking.

## 3. Example

```cpp
int numbers[5] = {10, 20, 30, 40, 50};

std::cout << numbers[0]; // 10
std::cout << numbers[4]; // 50
```

## 4. Access and Modify

```cpp
numbers[2] = 100;
```

Now:

```text
10 20 100 40 50
```

## 5. Memory Layout

For an `int` array:

```cpp
int arr[4] = {10, 20, 30, 40};
```

Elements are adjacent in memory.

```text
arr[0] arr[1] arr[2] arr[3]
  |      |      |      |
  v      v      v      v
 contiguous memory
```

Therefore, pointer arithmetic can move from one element to the next.

## 6. Interview Points

- Array indexing is `O(1)`.
- C-style arrays have fixed size.
- Elements are contiguous.
- Arrays do not perform bounds checking.
- `arr[i]` is closely related to pointer arithmetic.

## Quick Revision

```cpp
int arr[5];

arr[0] = 10;
arr[4] = 50;
```

**Key idea:** C-style arrays are fixed-size, contiguous collections of elements of the same type.
