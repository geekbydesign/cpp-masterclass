# Return by Pointer

A function can return a pointer:

```cpp
int* find(int* arr, int size, int target)
{
    for (int i = 0; i < size; ++i)
        if (arr[i] == target)
            return &arr[i];

    return nullptr;
}
```

The caller checks:

```cpp
if (int* p = find(arr, size, 20))
    std::cout << *p;
```

### Never

```cpp
int* getValue()
{
    int value = 10;
    return &value; // dangling
}
```

**Interview:** A pointer return can represent "not found" using `nullptr`; clearly define ownership and lifetime.
