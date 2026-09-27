# Rule of Three

The Rule of Three applies mainly to classes that manually manage a resource.

If a class needs one of these:

1. Destructor
2. Copy constructor
3. Copy assignment operator

it often needs all three.

## Example

```cpp
class Buffer
{
public:
    Buffer(const Buffer& other);
    Buffer& operator=(const Buffer& other);
    ~Buffer();

private:
    int* data;
};
```

Why?

If the class owns dynamically allocated memory, the compiler-generated copy operations may perform shallow copies.

That can cause:

- double deletion
- shared ownership when ownership was intended to be unique
- dangling pointers

## Rule

```text
Destructor
Copy constructor
Copy assignment
```

should be considered together when manual resource management exists.

## Modern C++

Prefer RAII members such as:

```cpp
std::vector
std::string
std::unique_ptr
```

when possible.

This often eliminates the need for manually implementing the Rule of Three.

## Interview Tip

The Rule of Three is mainly a consequence of **manual resource ownership**.
