# Move Assignment

Move assignment transfers resources into an object that already exists.

```cpp
class Buffer
{
public:
    Buffer& operator=(Buffer&& other) noexcept
    {
        if (this != &other)
        {
            delete data;

            data = other.data;
            other.data = nullptr;
        }

        return *this;
    }

private:
    int* data = nullptr;
};
```

## Signature

```cpp
T& operator=(T&& other);
```

## Example

```cpp
Buffer a;
Buffer b;

b = std::move(a);
```

`b` already exists, so move assignment is used.

## Copy vs Move Assignment

```cpp
b = a;            // copy assignment
b = std::move(a); // move assignment, if available
```

## Resource Management

Move assignment must usually:

1. Release the destination's current resource.
2. Take ownership of the source resource.
3. Put the source into a valid state.
4. Handle self-move safely enough for the type's requirements.

## Interview Tip

Move constructor:

```text
new object <- resource
```

Move assignment:

```text
existing object <- resource
```
