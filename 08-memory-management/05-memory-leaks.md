# Memory Leaks

## 1. What Is a Memory Leak?

A memory leak occurs when allocated storage remains allocated but the program loses the ability to release it.

```cpp
void function()
{
    int* p = new int(10);
} // allocation is leaked
```

## 2. Lost Pointer

```cpp
int* p = new int(10);
p = new int(20); // first allocation is now unreachable
```

## 3. Exception-Related Leak

```cpp
int* p = new int(10);
doSomething(); // throws

delete p; // never reached
```

## 4. RAII Prevents This Pattern

```cpp
auto p = std::make_unique<int>(10);
doSomething();
```

If an exception occurs, `p` is destroyed during stack unwinding.

## 5. Prevention

Prefer appropriate RAII types:

```cpp
std::vector<T>
std::string
std::unique_ptr<T>
std::shared_ptr<T>
```

## 6. Detection

Useful tools include AddressSanitizer/LeakSanitizer and Valgrind on supported platforms.

## Interview Point

```text
Memory leak     -> allocation remains but is unreachable
Dangling pointer -> pointer refers to invalid/dead storage
```

**Key idea:** RAII makes ownership and cleanup automatic and exception-safe.
