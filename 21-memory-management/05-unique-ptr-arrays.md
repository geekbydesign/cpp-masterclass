# `unique_ptr` Arrays

`std::unique_ptr` has a specialization for dynamically allocated arrays.

```cpp
std::unique_ptr<int[]> values =
    std::make_unique<int[]>(10);
```

Access:

```cpp
values[0] = 42;
```

The array is automatically released with the correct `delete[]`.

## Why `unique_ptr<T[]>`?

For an array:

```cpp
new int[10]
```

the matching deletion operation is:

```cpp
delete[] ptr;
```

`unique_ptr<T[]>` handles this automatically.

## Example

```cpp
void fill()
{
    auto values = std::make_unique<int[]>(5);

    for (int i = 0; i < 5; ++i)
        values[i] = i;
}
```

## Prefer Containers

For most modern C++ code, prefer:

```cpp
std::vector<int> values(10);
```

because it provides:

- size information
- iterators
- convenient algorithms
- dynamic resizing

Use `unique_ptr<T[]>` when a dynamically allocated fixed-size array with unique ownership is specifically appropriate.

## Interview Tip

```cpp
unique_ptr<T>   -> single object
unique_ptr<T[]> -> dynamic array
```
