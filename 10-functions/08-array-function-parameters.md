# Array Function Parameters

For a normal function parameter:

```cpp
void print(int arr[], int size);
```

is adjusted to:

```cpp
void print(int* arr, int size);
```

The array size is therefore not automatically preserved.

```cpp
void print(int arr[], int size)
{
    for (int i = 0; i < size; ++i)
        std::cout << arr[i];
}
```

### Important Trap

```cpp
sizeof(arr)
```

inside the function gives the pointer size, not the original array size.

To preserve the array:

```cpp
template <std::size_t N>
void print(int (&arr)[N]);
```

**Key idea:** Arrays normally decay to pointers when passed to functions.
