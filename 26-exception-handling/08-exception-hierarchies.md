# Exception Hierarchies

Exception types can form inheritance hierarchies.

```cpp
class NetworkError : public std::runtime_error {
public:
    using std::runtime_error::runtime_error;
};

class TimeoutError : public NetworkError {
public:
    using NetworkError::NetworkError;
};
```

A `TimeoutError` can be caught as:
- `TimeoutError`
- `NetworkError`
- `std::runtime_error`
- `std::exception`

## Catch Ordering

```cpp
catch (const TimeoutError& e) {
}
catch (const NetworkError& e) {
}
catch (const std::exception& e) {
}
```

Specific-to-general ordering preserves the most precise handling.

## Design Tip
Use inheritance when callers need to handle a family of related errors at different levels of abstraction.
