# Rvalue References

C++11 introduced rvalue references using `&&`.

```cpp
int&& ref = 10;
```

An rvalue reference can bind to an rvalue.

## Lvalue vs Rvalue

```cpp
int x = 10;
```

`x` is an lvalue.

```cpp
int&& r = 10;
```

`10` is an rvalue.

## Move Constructor

Rvalue references enable move operations:

```cpp
class Buffer
{
public:
    Buffer(Buffer&& other) noexcept;
};
```

## Important: Named Rvalue References Are Lvalues

```cpp
void process(Buffer&& value)
{
    // value is an lvalue expression here
}
```

To treat it as an rvalue again:

```cpp
process(std::move(value));
```

## Binding Rules

```cpp
int x = 10;

int& a = x;       // OK
int&& b = 10;     // OK
int&& c = x;      // ERROR
int& d = 10;      // ERROR
```

## `const` Rvalue Reference

```cpp
const int&& x = 10;
```

This can bind to rvalues but is uncommon for move semantics because moving generally modifies the source.

## Forwarding Reference

A parameter of the form:

```cpp
template <typename T>
void f(T&& value);
```

can be a forwarding reference when `T` is deduced.

This is an important C++11 foundation for perfect forwarding.

## Key Relationship

```text
rvalue reference
       ↓
enables
       ↓
move semantics
       ↓
resource transfer
```

## Interview Point

Do not say "`&&` always means rvalue reference." In a deduced `T&&` parameter, it can be a forwarding reference.
