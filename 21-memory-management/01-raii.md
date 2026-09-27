# RAII

RAII stands for **Resource Acquisition Is Initialization**.

The core idea is:

> Acquire a resource during object initialization and release it automatically when the object is destroyed.

Resources include:

- dynamic memory
- files
- mutex locks
- sockets
- database handles

## Example

```cpp
class File
{
public:
    File(const char* name)
    {
        // open file
    }

    ~File()
    {
        // close file
    }
};
```

The destructor guarantees cleanup when the object leaves its lifetime.

## Why RAII?

Without RAII:

```cpp
Resource* r = acquire();

if (error)
    return; // resource may leak

release(r);
```

With RAII:

```cpp
Resource r;
```

Cleanup happens automatically.

## Smart Pointers and RAII

```cpp
{
    auto ptr = std::make_unique<int>(42);
} // memory automatically released
```

## Key Principle

Resource lifetime should be tied to object lifetime.

```text
constructor -> acquire
destructor  -> release
```

## Interview Tip

RAII is the foundation of modern C++ resource management and is one of the main reasons smart pointers are preferred over raw owning pointers.
