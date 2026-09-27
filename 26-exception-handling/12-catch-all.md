# Catch-All Handler

`catch (...)` matches any exception.

```cpp
try {
    process();
}
catch (...) {
    // handle any exception
}
```

## Typical Use

A catch-all is sometimes useful at a top-level boundary:

```cpp
int main()
{
    try {
        run_application();
    }
    catch (...) {
        // final logging/cleanup policy
    }
}
```

## Important
You cannot directly inspect the exception through `...`.

If specific information is needed, prefer a typed handler.

## Ordering

```cpp
catch (const std::exception& e) {
}
catch (...) {
}
```

The catch-all should normally be last.
