# Exceptions in Destructors

Destructors should generally not allow exceptions to escape.

```cpp
class Resource {
public:
    ~Resource() noexcept {
        // cleanup
    }
};
```

Since C++11, destructors are implicitly `noexcept` unless their exception specification is affected otherwise.

## Dangerous Situation

If a destructor throws while another exception is already propagating, the program can call `std::terminate()`.

This makes throwing destructors especially dangerous during stack unwinding.

## Best Practice
- Perform cleanup without throwing.
- Catch and handle errors inside the destructor when appropriate.
- Report/log cleanup failures through a separate mechanism if necessary.

## Interview Rule

```text
Destructors should not throw.
```
