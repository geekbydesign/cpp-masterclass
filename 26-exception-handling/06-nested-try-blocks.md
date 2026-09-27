# Nested `try` Blocks

A `try` block can be nested inside another `try` block or function.

```cpp
try {
    try {
        throw std::runtime_error("error");
    }
    catch (const std::runtime_error& e) {
        std::cout << "inner";
        throw;
    }
}
catch (const std::exception& e) {
    std::cout << "outer";
}
```

The inner handler can handle the exception, rethrow it, or allow other exceptions to propagate.

## Important
Nested `try` blocks do not create a special exception type. They simply create additional handler scopes.

Use nesting when different layers genuinely have different responsibilities.
