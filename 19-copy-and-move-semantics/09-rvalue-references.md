# Rvalue References

An rvalue reference is declared using `&&`.

```cpp
std::string&& ref = std::string("hello");
```

It can bind to rvalues and is central to move semantics.

## Why?

Move constructors typically use:

```cpp
T(T&& other);
```

This allows the constructor to distinguish an expiring object from a normal lvalue.

## Example

```cpp
class Buffer
{
public:
    Buffer(Buffer&& other) noexcept;
};
```

## Lvalue vs Rvalue Reference

```cpp
T&   // lvalue reference
T&&  // rvalue reference
```

```cpp
T object;

T& a = object;       // OK
T&& b = T{};         // OK
T&& c = object;      // error
```

## Named Rvalue References

A named rvalue-reference variable is itself an lvalue expression:

```cpp
T&& ref = T{};
someFunction(ref); // treated as lvalue
```

To treat it as an rvalue again:

```cpp
someFunction(std::move(ref));
```

## Interview Tip

`T&&` does not automatically mean "this variable is always movable." Expression value category matters.
