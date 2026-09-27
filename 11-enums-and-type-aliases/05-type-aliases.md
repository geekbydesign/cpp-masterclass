# Type Aliases

## `using` aliases

C++11 introduced the modern type-alias syntax:

```cpp
using Integer = int;
using String = std::string;
```

Example:

```cpp
Integer x = 10;
String name = "Sachin";
```

A type alias does not create a new type.

## `typedef`

The older syntax is:

```cpp
typedef int Integer;
```

Modern C++ generally prefers:

```cpp
using Integer = int;
```

## Pointer aliases

```cpp
using IntPtr = int*;

IntPtr p = nullptr;
```

## Function pointer aliases

```cpp
using Callback = void(*)(int);

void process(int value)
{
}

Callback cb = process;
```

## Alias templates

`using` supports template aliases:

```cpp
template <typename T>
using Vector = std::vector<T>;

Vector<int> numbers;
Vector<std::string> names;
```

This is a major advantage over `typedef`.

## Alias does not create a distinct type

```cpp
using Meter = double;
using Second = double;
```

`Meter` and `Second` are both `double`.

If distinct type safety is required, use a wrapper type such as a `struct`.

## Type alias vs enum

A type alias:

```cpp
using ID = int;
```

gives another name to an existing type.

An enum:

```cpp
enum class IDType
{
    User,
    Device
};
```

defines a distinct enumeration type.

## Interview points

- `using Name = Type;` creates a type alias.
- `typedef` is the older syntax.
- Alias templates work with `using`.
- Type aliases do not create new distinct types.
- Prefer `using` in modern C++.
