# Copy Assignment Operator

The copy assignment operator assigns an existing object from another object of the same type.

```cpp
class Buffer
{
public:
    Buffer& operator=(const Buffer& other)
    {
        if (this != &other)
        {
            data = other.data;
        }

        return *this;
    }

private:
    std::vector<int> data;
};
```

## Signature

```cpp
T& operator=(const T& other);
```

## Copy Assignment vs Copy Constructor

```cpp
T b = a; // copy construction

T b;
b = a;   // copy assignment
```

## Self-Assignment

```cpp
a = a;
```

Resource-owning implementations must handle this correctly.

## Return `*this`

```cpp
return *this;
```

allows chaining:

```cpp
a = b = c;
```

## Move Assignment

A type may also provide:

```cpp
T& operator=(T&& other);
```

for move assignment.

## Rule of Three/Five

A custom copy assignment operator is commonly considered together with:

- destructor
- copy constructor
- move constructor
- move assignment

when manual resource ownership is involved.

## Interview Tip

`operator=` is always an assignment operation; it is not a constructor.
