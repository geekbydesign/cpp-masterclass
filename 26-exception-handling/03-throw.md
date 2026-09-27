# `throw`

The `throw` expression raises an exception.

```cpp
throw std::runtime_error("Invalid value");
```

## Throwing Different Types

C++ allows throwing objects of many types:

```cpp
throw 42;
throw std::string{"error"};
throw std::runtime_error{"failure"};
```

In application code, throwing standard or custom exception types is generally clearer than throwing primitive values.

## Throwing from a Function

```cpp
void process(int value)
{
    if (value < 0)
        throw std::invalid_argument("negative value");
}
```

The function does not need to return an error code when the error is represented by an exception.

## `throw` and Control Flow
Once an exception is thrown, normal execution after the throw is skipped until a matching handler is found.
