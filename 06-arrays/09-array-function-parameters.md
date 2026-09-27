# Array Function Parameters

## 1. Array Parameter Syntax

These function declarations are effectively equivalent for a parameter:

```cpp
void print(int arr[]);
void print(int arr[5]);
void print(int* arr);
```

For a normal function parameter, the array type is adjusted to a pointer type.

## 2. Example

```cpp
void print(int arr[], int size)
{
    for (int i = 0; i < size; ++i)
    {
        std::cout << arr[i] << ' ';
    }
}
```

Call:

```cpp
int arr[] = {10, 20, 30, 40};

print(arr, 4);
```

The size must normally be passed separately.

## 3. `sizeof` Trap

```cpp
void printSize(int arr[])
{
    std::cout << sizeof(arr);
}
```

Inside the function, `arr` behaves as a pointer parameter, so `sizeof(arr)` gives the pointer size.

It does **not** give the original array size.

## 4. Preserve Size with Reference

For a fixed-size array:

```cpp
template <std::size_t N>
void print(int (&arr)[N])
{
    for (std::size_t i = 0; i < N; ++i)
        std::cout << arr[i] << ' ';
}
```

Now the array does not decay, and the size is known through `N`.

## 5. Pass as `const`

If the function does not modify the array:

```cpp
void print(const int* arr, std::size_t size)
{
    for (std::size_t i = 0; i < size; ++i)
        std::cout << arr[i];
}
```

## 6. Modern Alternatives

For fixed-size arrays:

```cpp
std::array<int, 5>
```

For dynamic-size sequences:

```cpp
std::vector<int>
```

For non-owning views in C++20:

```cpp
std::span<const int>
```

## Interview Points

- Array parameters normally become pointer parameters.
- Array size is not automatically preserved.
- `sizeof` inside such a function gives pointer size.
- Pass size separately or use an array reference / `std::array` / `std::span`.

**Key idea:** Be careful about array-to-pointer decay at function boundaries.
