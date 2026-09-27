# `try` / `catch`

A `try` block contains code that may throw. A `catch` handler handles a matching exception.

```cpp
try {
    throw std::runtime_error("failure");
}
catch (const std::runtime_error& e) {
    std::cout << e.what();
}
```

## Syntax

```cpp
try {
    // protected code
}
catch (Type1 const& e) {
    // handle
}
catch (Type2 const& e) {
    // handle
}
```

## Important
A handler is selected based on the thrown exception and the available catch parameter conversions.

Prefer catching exceptions by `const` reference:

```cpp
catch (const std::exception& e)
```

This avoids unnecessary copying and preserves polymorphism.
