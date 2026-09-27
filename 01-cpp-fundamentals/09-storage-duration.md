# Storage Duration

Storage duration describes how long the storage associated with an object lasts.

C++ has four standard storage duration categories:

```text
automatic
static
thread
dynamic
```

## 1. Automatic Storage Duration

Typical local variables have automatic storage duration.

```cpp
void test()
{
    int value = 10;
}
```

`value` is created as execution reaches its declaration and its storage is released when the block is exited.

Common examples:

```cpp
int local;
MyClass object;
```

## 2. Static Storage Duration

Objects with static storage duration exist for the entire program execution.

### Global variable

```cpp
int globalValue = 10;
```

### Static local variable

```cpp
void counter()
{
    static int count = 0;
    ++count;
}
```

`count` keeps its value between function calls.

### Static data member

```cpp
class Counter
{
public:
    static int value;
};
```

A static data member has static storage duration.

## 3. Thread Storage Duration

Use `thread_local`:

```cpp
thread_local int value = 0;
```

Each thread gets its own instance.

Conceptually:

```text
Thread A → value A
Thread B → value B
Thread C → value C
```

The objects exist for the lifetime of their associated threads.

## 4. Dynamic Storage Duration

Objects created dynamically have dynamic storage duration.

```cpp
int* p = new int(42);

delete p;
```

The object's lifetime is controlled by dynamic allocation/deallocation.

Modern C++ normally prefers:

```cpp
auto p = std::make_unique<int>(42);
```

instead of manual `new`/`delete`.

## 5. Storage Duration vs Scope

These concepts are different.

Example:

```cpp
void counter()
{
    static int value = 0;
}
```

`value`:

- has block scope
- has static storage duration

So its name is only accessible inside `counter()`, but its object survives between calls.

## 6. Storage Duration vs Lifetime

Storage duration describes the duration of storage associated with an object.

Object lifetime is the period during which the object is considered to exist.

For ordinary objects these concepts are closely related, but C++ object lifetime has additional rules involving initialization, destruction, storage reuse, unions, placement construction, and other cases.

## 7. Comparison

| Category | Typical example | Duration |
|---|---|---|
| Automatic | Local variable | Enclosing execution scope |
| Static | Global/static local | Program duration |
| Thread | `thread_local` | Associated thread |
| Dynamic | `new` / allocator | Until released appropriately |

## 8. Initialization of Static Objects

Static-storage objects can have:

- constant initialization
- zero initialization
- dynamic initialization

Initialization order becomes particularly important when multiple translation units are involved.

This is one reason global objects should be used carefully.

## 9. Automatic vs Dynamic

### Automatic

```cpp
void test()
{
    int value = 10;
}
```

The language manages the object's storage automatically.

### Dynamic

```cpp
int* value = new int(10);
delete value;
```

The programmer is responsible for correct ownership and release.

Modern C++ recommendation:

```cpp
auto value = std::make_unique<int>(10);
```

Now RAII manages the lifetime.

## 10. Interview Questions

### What are the four storage durations?

```text
Automatic
Static
Thread
Dynamic
```

### What is the difference between a static local and a global?

Both have static storage duration, but their names have different scopes and they have different initialization/access characteristics.

### Does `static` always mean the object is global?

No.

```cpp
void f()
{
    static int x = 0;
}
```

`x` has static storage duration but block scope.

## Quick Revision

```text
Automatic
    local variables

Static
    globals
    static locals
    static data members

Thread
    thread_local

Dynamic
    dynamically allocated objects
```
