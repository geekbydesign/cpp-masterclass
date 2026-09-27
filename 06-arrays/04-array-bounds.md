# Array Bounds

## 1. Valid Index Range

For:

```cpp
int arr[5];
```

Valid indices are:

```text
0 1 2 3 4
```

The following is outside the array:

```cpp
arr[5];
```

## 2. C-Style Arrays Do Not Perform Bounds Checking

```cpp
int arr[3] = {10, 20, 30};

std::cout << arr[10]; // Undefined behavior
```

C++ does not automatically throw an exception for this.

## 3. Why Is It Dangerous?

Out-of-bounds access can:

- Read unrelated memory.
- Modify unrelated memory.
- Produce unpredictable results.
- Cause crashes.
- Introduce security vulnerabilities.

## 4. Loop Carefully

Correct:

```cpp
for (int i = 0; i < 5; ++i)
{
    std::cout << arr[i];
}
```

Incorrect:

```cpp
for (int i = 0; i <= 5; ++i)
{
    std::cout << arr[i];
}
```

The second loop accesses `arr[5]`.

## 5. Boundary Rule

For an array of size `N`:

```text
0 <= index < N
```

## 6. Safer Alternatives

`std::array` and `std::vector` provide `.at()` for bounds-checked access:

```cpp
std::array<int, 3> arr = {1, 2, 3};

arr.at(2); // valid
// arr.at(3); // throws std::out_of_range
```

## Interview Points

- C-style array indexing has no bounds checking.
- Out-of-bounds access is undefined behavior.
- The last valid index is `size - 1`.
- Off-by-one errors are common interview bugs.

**Key idea:** Always keep array indices within `[0, size)`.
