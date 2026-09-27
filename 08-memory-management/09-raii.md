# RAII

## 1. What Is RAII?

**RAII** means **Resource Acquisition Is Initialization**.

A resource is tied to the lifetime of an object. The object's destructor releases the resource.

## 2. Memory Example

Raw ownership:

```cpp
int* p = new int(10);
delete p;
```

RAII:

```cpp
auto p = std::make_unique<int>(10);
```

When `p` leaves scope, the managed object is destroyed automatically.

## 3. Exception Safety

```cpp
void function()
{
    auto p = std::make_unique<int>(10);
    doSomething(); // may throw
}
```

During stack unwinding, `p` is destroyed automatically.

## 4. RAII Beyond Memory

RAII can manage:

- Dynamic memory.
- Files.
- Mutex locks.
- Sockets.
- OS handles.
- Database connections.

Examples:

```cpp
std::unique_ptr<T>
std::shared_ptr<T>
std::vector<T>
std::string
std::fstream
std::lock_guard<std::mutex>
std::scoped_lock
```

## 5. Ownership

Prefer a clear RAII owner:

```cpp
auto p = std::make_unique<MyClass>();
```

Use `shared_ptr` only when shared ownership is genuinely required.

## 6. Scope-Based Cleanup

```cpp
{
    std::ofstream file("data.txt");
    file << "Hello";
}
// file is automatically closed
```

## Interview Points

- RAII ties resource lifetime to object lifetime.
- Destructors perform cleanup.
- Cleanup is deterministic.
- RAII is naturally exception-safe.
- RAII applies to resources beyond memory.

**Key idea:** In modern C++, prefer deterministic resource ownership through RAII instead of manual cleanup.
