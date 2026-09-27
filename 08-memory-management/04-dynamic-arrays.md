# Dynamic Arrays

## 1. Creating a Dynamic Array

```cpp
std::size_t n = 5;
int* arr = new int[n];
```

## 2. Initialize to Zero

```cpp
int* arr = new int[n]{};
```

## 3. Access

```cpp
arr[0] = 10;
arr[1] = 20;
```

## 4. Release

```cpp
delete[] arr;
arr = nullptr;
```

## 5. Size Is Not Stored in the Pointer

```cpp
int* arr = new int[10];
sizeof(arr); // pointer size, not array size
```

Track the number of elements separately.

## 6. Prefer `std::vector`

```cpp
std::vector<int> values(n);
```

Advantages:

- Automatic memory management.
- Stores its size.
- `.at()` provides bounds checking.
- Works naturally with STL algorithms.
- Better exception safety.

## Interview Points

- Runtime-sized raw arrays use `new[]`.
- Use `delete[]` for `new[]`.
- A raw pointer does not contain the array length.
- `std::vector` is normally preferred.

**Key idea:** Use raw dynamic arrays only when low-level control is genuinely required.
