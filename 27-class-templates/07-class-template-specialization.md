# Class Template Specialization

A full specialization provides a custom implementation for a specific template argument.

```cpp
template <typename T>
class Printer {
public:
    void print() {
        std::cout << "Generic";
    }
};

template <>
class Printer<bool> {
public:
    void print() {
        std::cout << "Boolean";
    }
};
```

Now:

```cpp
Printer<int> a;   // generic
Printer<bool> b;  // specialized
```

## Why Specialize?

Use specialization when a particular type needs fundamentally different behavior or representation.

## Important

Full specialization specifies **all** template arguments.

```cpp
template <>
class Printer<bool> {
};
```

Partial specialization is different and can specialize a subset or pattern of parameters.
