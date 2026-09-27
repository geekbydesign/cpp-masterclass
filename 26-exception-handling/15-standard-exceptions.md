# Standard Exceptions

The standard library provides a hierarchy rooted at `std::exception`.

Common types include:

| Exception | Typical meaning |
|---|---|
| `std::exception` | General standard exception |
| `std::runtime_error` | Runtime failure |
| `std::logic_error` | Program/input logic error |
| `std::invalid_argument` | Invalid argument |
| `std::domain_error` | Argument outside valid domain |
| `std::length_error` | Object exceeds allowed length |
| `std::out_of_range` | Index/value outside valid range |
| `std::overflow_error` | Arithmetic overflow |
| `std::underflow_error` | Arithmetic underflow |
| `std::bad_alloc` | Allocation failure |
| `std::bad_cast` | Failed reference `dynamic_cast` |
| `std::bad_typeid` | Invalid `typeid` use in relevant cases |

Example:

```cpp
throw std::out_of_range("Index out of range");
```

Catch through the common interface:

```cpp
catch (const std::exception& e) {
    std::cout << e.what();
}
```

Use the most specific standard exception that accurately describes the failure.
