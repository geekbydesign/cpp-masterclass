# Lvalues and Rvalues

Value categories help determine how expressions can be used and which overloads are selected.

## Lvalue

An lvalue generally refers to an object with an identity that persists beyond the expression.

```cpp
int x = 10;

x = 20; // x is an lvalue
```

You can take its address:

```cpp
int* p = &x;
```

## Rvalue

An rvalue generally represents a temporary/value that is not a persistent named object.

```cpp
int x = 10;

int y = x + 5;
```

The expression `x + 5` is an rvalue.

Temporary objects are also commonly rvalues:

```cpp
std::string("hello")
```

## Why It Matters

Overloads can distinguish them:

```cpp
void process(const std::string&);
void process(std::string&&);
```

```cpp
std::string s = "hello";

process(s);                  // lvalue overload
process(std::string("hi"));  // rvalue overload
```

## Important

C++ has more detailed value categories:

```text
glvalue
├── lvalue
└── xvalue

rvalue
├── xvalue
└── prvalue
```

For practical move semantics, the key distinction is usually **lvalue vs rvalue/xvalue**.

## Interview Tip

A named variable is an lvalue even if its type is `T&&`:

```cpp
T&& ref = T{};
ref; // lvalue expression
```
