# Lifetime

Lifetime is the period during which an object exists and its stored state can be used according to the language rules.

## 1. Lifetime vs Scope

These are not the same.

```cpp
void counter()
{
    static int value = 0;
    ++value;
}
```

The name `value` has block scope, but the object has static storage duration and remains alive for the lifetime of the program.

## 2. Typical Automatic Object

```cpp
void test()
{
    int x = 10;
}
```

`x` is created when execution reaches its declaration and its lifetime normally ends when the block is exited.

## 3. Dynamic Objects

```cpp
int* p = new int(42);

delete p;
```

The dynamically allocated object's lifetime begins when storage is obtained and its initialization is complete, and ends when it is destroyed/deallocated appropriately.

Modern C++ generally prefers RAII and smart pointers instead of direct `new`/`delete`.

## 4. Static Lifetime

Objects with static storage duration exist for the duration of the program.

Example:

```cpp
int globalValue = 10;

void test()
{
    static int count = 0;
}
```

Both objects have static storage duration.

## 5. Thread Storage Duration

C++ also supports thread-local objects:

```cpp
thread_local int value = 0;
```

A thread-local object's lifetime is associated with the lifetime of its thread.

Detailed concurrency usage is covered separately.

## 6. Storage Duration Categories

C++ commonly discusses four storage durations:

```text
automatic
static
thread
dynamic
```

Storage duration and lifetime are closely related but should not be treated as identical concepts in every language-lawyer situation.

## 7. Constructor and Destructor

For class objects, lifetime is connected to construction and destruction.

```cpp
class Resource
{
public:
    Resource()
    {
        std::cout << "constructed\n";
    }

    ~Resource()
    {
        std::cout << "destroyed\n";
    }
};

void test()
{
    Resource r;
}
```

Typical output:

```text
constructed
destroyed
```

## 8. Lifetime and References

A reference does not extend the lifetime of an arbitrary object merely because it refers to it.

Dangerous example:

```cpp
int& getReference()
{
    int value = 10;
    return value; // dangling reference
}
```

`value` is destroyed when the function returns.

## 9. Dangling Pointers/References

A pointer or reference becomes dangling when the object it refers to has ended its lifetime.

```cpp
int* getPointer()
{
    int value = 10;
    return &value; // dangling pointer
}
```

Using the returned pointer is invalid.

## 10. Temporary Lifetime

Temporary objects have defined lifetime-extension rules in certain contexts.

For example:

```cpp
const std::string& ref = std::string("hello");
```

The temporary's lifetime is extended in this specific initialization context.

Do not generalize this into "references always extend temporary lifetime"; the rules depend on the context.

## 11. Lifetime and RAII

RAII ties resource ownership to object lifetime.

```cpp
{
    std::lock_guard<std::mutex> lock(mutex);
    // protected work
}
// lock is destroyed here and releases the mutex
```

This idea is fundamental to modern C++.

## Interview Points

- Lifetime is about an object's existence.
- Scope is about a name's visibility.
- Automatic objects normally end when their enclosing scope exits.
- Static objects live for the program duration.
- Thread-local objects are associated with a thread.
- Dynamic objects require correct lifetime management.
- Dangling pointers/references refer to objects whose lifetime has ended.
- RAII uses object lifetime to manage resources.
