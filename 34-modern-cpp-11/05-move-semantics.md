# Move Semantics

Move semantics were introduced in C++11 to transfer resources from temporary or explicitly movable objects instead of unnecessarily copying them.

## Why Move?

Consider a class owning heap memory:

```cpp
class Buffer
{
    int* data;
};
```

Copying may require allocating and copying the entire resource.

Moving can transfer ownership of the resource.

## Move Constructor

```cpp
class Buffer
{
public:
    Buffer(Buffer&& other) noexcept
    {
        data = other.data;
        other.data = nullptr;
    }

private:
    int* data{};
};
```

The source gives up ownership.

## Move Assignment

```cpp
Buffer& operator=(Buffer&& other) noexcept
{
    if (this != &other)
    {
        delete[] data;

        data = other.data;
        other.data = nullptr;
    }

    return *this;
}
```

## `std::move`

```cpp
Buffer a;

Buffer b = std::move(a);
```

`std::move` does not itself move anything. It casts its argument so that move operations can be selected.

## Moved-From Objects

After moving:

```cpp
Buffer b = std::move(a);
```

`a` remains a valid object, but its value/state is generally unspecified unless the type documents a stronger guarantee.

## Copy vs Move

```text
Copy → duplicate resource
Move → transfer resource
```

## C++11 Containers

Standard containers use move operations to improve performance when possible.

```cpp
std::vector<Buffer> values;
values.push_back(Buffer{});
```

## `noexcept`

Move constructors are often declared:

```cpp
Buffer(Buffer&&) noexcept;
```

This can allow standard containers to prefer moving during operations such as reallocation.

## Interview Point

Move semantics are about resource transfer and avoiding unnecessary deep copies, not simply about "moving memory".
