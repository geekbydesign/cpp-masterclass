# Polymorphic Exceptions

Exception objects can be handled polymorphically.

```cpp
try {
    throw TimeoutError("request timed out");
}
catch (const NetworkError& e) {
    std::cout << e.what();
}
```

Because `TimeoutError` derives from `NetworkError`, the base handler can catch it.

## Catch by Reference

Prefer:

```cpp
catch (const std::exception& e)
```

instead of:

```cpp
catch (std::exception e)
```

Catching by value can cause slicing and unnecessary copying.

## Key Point
Exception polymorphism follows normal inheritance rules, while the runtime performs exception-handler matching.
