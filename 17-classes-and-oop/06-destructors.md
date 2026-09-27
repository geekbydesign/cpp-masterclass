# Destructors

A destructor performs cleanup when an object is destroyed.

```cpp
class Resource
{
public:
    ~Resource()
    {
        // cleanup
    }
};
```

## Destructor syntax

```cpp
~ClassName()
{
}
```

A destructor:

- has the class name preceded by `~`
- has no return type
- takes no parameters
- cannot be overloaded

## Automatic destruction

```cpp
void function()
{
    Resource resource;
} // destructor called here
```

For automatic objects, destruction occurs when the object leaves its scope.

## Dynamic objects

```cpp
Resource* p = new Resource;

delete p; // destructor runs
```

Modern C++ should prefer RAII and smart pointers instead of manual `new`/`delete`.

## Destruction order

For an object:

1. destructor body executes
2. non-static data members are destroyed in reverse declaration order
3. base classes are destroyed in reverse inheritance order

## Virtual destructors

A base class intended for polymorphic deletion should generally have a virtual destructor:

```cpp
class Base
{
public:
    virtual ~Base() = default;
};
```

Then:

```cpp
Base* p = new Derived;
delete p;
```

can correctly destroy the derived object.

## RAII

Resource ownership should normally be tied to object lifetime:

```cpp
{
    std::lock_guard<std::mutex> lock(mutex);
    // protected work
} // lock released automatically
```

## Interview point

Destructors are central to RAII. In modern C++, deterministic cleanup should usually be handled through object lifetime rather than manual cleanup calls.
