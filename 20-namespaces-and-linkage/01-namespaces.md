# Namespaces

A namespace groups related names and prevents name collisions.

```cpp
namespace math
{
    int add(int a, int b)
    {
        return a + b;
    }
}
```

Use the scope-resolution operator:

```cpp
int result = math::add(2, 3);
```

## Why Namespaces?

Without namespaces:

```cpp
int value;
int value; // conflict
```

With namespaces:

```cpp
namespace A { int value; }
namespace B { int value; }

A::value;
B::value;
```

## Namespace Members

A namespace can contain:

- variables
- functions
- classes
- enums
- aliases
- nested namespaces

## Namespace Scope

Names declared inside a namespace belong to that namespace.

```cpp
namespace Config
{
    constexpr int MaxConnections = 10;
}
```

Access:

```cpp
Config::MaxConnections
```

## Standard Namespace

The C++ standard library uses `std`:

```cpp
std::vector<int> values;
std::cout << "Hello";
```

## Interview Tip

Namespaces provide **scope-based name organization** and help avoid naming collisions.
