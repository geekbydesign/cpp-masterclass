# Custom Exceptions

Applications can define their own exception types.

```cpp
class FileError : public std::runtime_error {
public:
    explicit FileError(const std::string& message)
        : std::runtime_error(message)
    {
    }
};
```

Usage:

```cpp
throw FileError("Could not open file");
```

Handling:

```cpp
catch (const FileError& e) {
    std::cout << e.what();
}
```

## Best Practice
Derive application-specific exceptions from an appropriate standard exception.

This gives callers access to:
- A meaningful specific type.
- The common `std::exception` interface.
- `what()` for diagnostic information.

Keep custom exception classes focused on useful error information.
