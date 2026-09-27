# Rule of Zero

The Rule of Zero says that a class should ideally avoid manually declaring special member functions by using RAII types to own resources.

Instead of:

```cpp
class Buffer
{
    int* data;
};
```

prefer:

```cpp
class Buffer
{
    std::vector<int> data;
};
```

or:

```cpp
class Resource
{
    std::unique_ptr<ResourceImpl> impl;
};
```

## Benefits

The compiler can generate appropriate:

- destructor
- copy operations
- move operations

based on the member types.

## Example

```cpp
class Person
{
public:
    Person(std::string name)
        : name(std::move(name))
    {
    }

private:
    std::string name;
};
```

No manual destructor or copy/move operations are needed.

## Main Principle

> Make resource-owning types responsible for resource management.

Then compose those types into higher-level classes.

## Interview Tip

Rule of Zero is usually the preferred modern C++ design when ownership can be expressed with standard RAII types.
