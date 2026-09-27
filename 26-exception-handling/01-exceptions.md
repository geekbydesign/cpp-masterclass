# Exceptions

Exceptions provide a mechanism for reporting and handling exceptional runtime conditions separately from normal control flow.

```cpp
try {
    // code that may fail
}
catch (const std::exception& e) {
    std::cout << e.what();
}
```

## Basic Flow

```text
throw → search for matching handler → catch
```

When an exception is thrown, normal execution of the current scope stops and C++ searches for a matching handler.

## Key Points
- Exceptions separate error detection from error handling.
- An exception can propagate through multiple function calls.
- Stack unwinding occurs while searching for a handler.
- Standard exceptions derive from `std::exception`.

## Interview Tip
Exception handling is part of C++'s runtime control-flow mechanism; it is not simply a return-value-based error convention.
