# Move Constructors

## Purpose

A move constructor transfers resources from a temporary or expiring object instead of copying them.

Typical signature:

```cpp
T(T&& other);
```

Example:

```cpp
class Buffer
{
public:
    Buffer(Buffer&& other) noexcept
        : data(other.data)
    {
        other.data = nullptr;
    }

private:
    int* data = nullptr;
};
```

## Why Move?

Copying:

```text
source resource -> allocate/copy -> destination
```

Moving:

```text
source resource ownership -> destination
```

Moving can be much cheaper for resource-owning types.

## `std::move`

```cpp
Buffer b1;
Buffer b2 = std::move(b1);
```

`std::move` does not move data itself. It casts an expression to an rvalue reference so that move operations can be selected.

## Moved-From Object

After moving, the source object remains valid but its value/state is generally unspecified unless the type documents stronger guarantees.

## `noexcept`

Move constructors should commonly be marked `noexcept` when they truly cannot throw.

This can allow standard containers to prefer moving during reallocation.

## Rule of 5

For manually managed resources, the special members may include:

- destructor
- copy constructor
- copy assignment
- move constructor
- move assignment
