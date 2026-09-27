# Shallow Copy vs Deep Copy

## Shallow Copy

A shallow copy copies the value of a pointer.

```cpp
class Buffer
{
public:
    Buffer(int value)
        : data(new int(value))
    {
    }

    Buffer(const Buffer& other)
        : data(other.data) // shallow copy
    {
    }

private:
    int* data;
};
```

Now both objects point to the same memory.

This can cause:

- double deletion
- shared unintended state
- dangling pointers

## Deep Copy

A deep copy allocates independent storage and copies the pointed-to value.

```cpp
Buffer(const Buffer& other)
    : data(new int(*other.data))
{
}
```

Now each object owns separate memory.

## Rule of 3

If a class manually manages a resource, it may need:

1. Destructor
2. Copy constructor
3. Copy assignment operator

Modern C++ usually prefers RAII types such as:

```cpp
std::unique_ptr
std::vector
std::string
```

to avoid manual ownership.

## Interview Tip

Shallow copy copies the **resource handle/pointer**.

Deep copy copies the **owned resource itself**.
