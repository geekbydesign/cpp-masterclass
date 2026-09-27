# Rule of Five

The Rule of Five extends the Rule of Three to move semantics.

A resource-managing class may need:

1. Destructor
2. Copy constructor
3. Copy assignment operator
4. Move constructor
5. Move assignment operator

```cpp
class Buffer
{
public:
    Buffer(const Buffer&);
    Buffer& operator=(const Buffer&);

    Buffer(Buffer&&) noexcept;
    Buffer& operator=(Buffer&&) noexcept;

    ~Buffer();
};
```

## Why Five?

Copy operations duplicate resources.

Move operations transfer resources.

The destructor releases the resource.

All five operations must form a consistent ownership model.

## Important

Declaring or deleting some special member functions can affect whether other special member functions are implicitly generated.

Therefore, explicitly designing the special members matters.

## Modern C++

Prefer the Rule of Zero whenever possible.

Use RAII types:

```cpp
std::vector<int>
std::string
std::unique_ptr<int>
```

instead of manually managing raw resources.

## Interview Tip

```text
Rule of 3 = copy + destruction
Rule of 5 = copy + move + destruction
Rule of 0 = let RAII members manage everything
```
