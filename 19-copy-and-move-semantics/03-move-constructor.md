# Move Constructor

A move constructor initializes a new object by transferring resources from another object.

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

## Signature

```cpp
T(T&& other);
```

The parameter is an rvalue reference.

## Why Move?

Suppose an object owns a large resource:

```text
Copy:
source -> allocate new resource -> copy data

Move:
source resource ownership -> destination
```

Moving can avoid expensive allocation and copying.

## Example

```cpp
Buffer createBuffer();

Buffer b = createBuffer();
```

Depending on the situation, the compiler may use move construction or eliminate the construction entirely through copy elision.

## Moved-From Object

After a move, the source object must remain valid for destruction and other operations allowed by its type.

For many standard types, the moved-from state is valid but unspecified.

## `noexcept`

Prefer:

```cpp
Buffer(Buffer&& other) noexcept;
```

when the move operation genuinely cannot throw.

This is particularly important for standard containers during reallocation.

## Interview Tip

Move construction transfers resources into a **new object**.
