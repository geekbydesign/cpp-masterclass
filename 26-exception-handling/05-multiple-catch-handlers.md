# Multiple Catch Handlers

A single `try` block can have multiple handlers.

```cpp
try {
    process();
}
catch (const std::invalid_argument& e) {
    // handle invalid input
}
catch (const std::runtime_error& e) {
    // handle runtime failure
}
catch (const std::exception& e) {
    // general standard exception
}
```

## Handler Ordering

Put more specific handlers before more general handlers.

```cpp
catch (const std::exception& e) {
}

catch (const std::runtime_error& e) { // unreachable
}
```

The second handler cannot be selected because `runtime_error` derives from `exception`.

## Key Rule

```text
specific → general
```

This is especially important for exception hierarchies.
