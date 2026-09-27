# `if` With Initializer

C++17 allows an initializer inside an `if` statement.

## Syntax

```cpp
if (initializer; condition)
{
    // ...
}
```

Example:

```cpp
if (int value = getValue(); value > 0)
{
    std::cout << value;
}
```

## Scope

The initializer variable is available in:

- the condition
- the `if` body
- the corresponding `else` body

```cpp
if (int value = getValue(); value > 0)
{
    std::cout << value;
}
else
{
    std::cout << value;
}
```

It is not available after the complete `if-else` statement.

## Why Use It?

Instead of:

```cpp
int value = getValue();

if (value > 0)
{
    // ...
}
```

you can limit the variable's scope:

```cpp
if (int value = getValue(); value > 0)
{
    // ...
}
```

This is especially useful when the value is only relevant to the decision.

## `std::optional` Example

```cpp
if (auto result = findValue(); result.has_value())
{
    std::cout << *result;
}
else
{
    std::cout << "Not found";
}
```

## RAII Example

An initializer can also be an object whose lifetime is tied to the `if` statement:

```cpp
if (std::lock_guard<std::mutex> lock(mutex);
    ready)
{
    process();
}
```

## C++ Version

```text
C++17
```

## Quick Revision

```cpp
if (auto value = getValue(); condition(value))
{
}
```

The initializer variable's scope is limited to the `if` statement.
