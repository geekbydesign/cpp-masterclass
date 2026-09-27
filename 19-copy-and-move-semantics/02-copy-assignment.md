# Copy Assignment

Copy assignment assigns the state of an existing object from another existing object.

```cpp
class Person
{
public:
    Person& operator=(const Person& other)
    {
        if (this != &other)
        {
            name = other.name;
            age = other.age;
        }

        return *this;
    }

private:
    std::string name;
    int age{};
};
```

## Typical Signature

```cpp
T& operator=(const T& other);
```

## Example

```cpp
Person a{"Alice", 30};
Person b{"Bob", 40};

b = a;
```

`b` already exists, so copy assignment is used.

## Self-Assignment

A resource-owning class must consider:

```cpp
a = a;
```

A common guard is:

```cpp
if (this != &other)
```

Modern implementations can also use designs that naturally handle self-assignment.

## Copy Constructor vs Assignment

| Operation | Purpose |
|---|---|
| Copy constructor | Creates a new object |
| Copy assignment | Replaces state of an existing object |

## Return Value

Assignment operators conventionally return `*this` by reference:

```cpp
return *this;
```

This enables:

```cpp
a = b = c;
```
