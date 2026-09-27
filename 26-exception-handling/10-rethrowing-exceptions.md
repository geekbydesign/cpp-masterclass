# Rethrowing Exceptions

A handler can rethrow the currently handled exception using a bare `throw;`.

```cpp
try {
    process();
}
catch (const std::exception& e) {
    log(e.what());
    throw;
}
```

The exception continues propagating to an outer handler.

## `throw;` vs `throw e;`

```cpp
catch (const std::exception& e) {
    throw;     // rethrows the current exception
}
```

A bare `throw;` preserves the current exception object.

```cpp
catch (const std::exception& e) {
    throw e;   // throws e as an expression
}
```

`throw e` can change the exception's effective type because `e` is an expression of the handler parameter's type.

## Common Pattern

```text
catch → log/add local handling → throw;
```
