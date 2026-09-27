# Fold Expressions

C++17 introduced fold expressions for conveniently applying an operator to a parameter pack.

They are especially useful in variadic templates.

## Unary Right Fold

```cpp
template <typename... Args>
auto sum(Args... args)
{
    return (args + ...);
}
```

For:

```cpp
sum(1, 2, 3, 4);
```

the expression behaves like:

```cpp
1 + (2 + (3 + 4))
```

## Unary Left Fold

```cpp
return (... + args);
```

Conceptually:

```cpp
(((1 + 2) + 3) + 4)
```

## Binary Fold

A binary fold supplies an initial value:

```cpp
return (args + ... + 0);
```

This is useful for handling empty parameter packs for operators where an identity value is appropriate.

## Logical Operators

```cpp
template <typename... Args>
bool all(Args... args)
{
    return (args && ...);
}
```

```cpp
template <typename... Args>
bool any(Args... args)
{
    return (args || ...);
}
```

## Printing

```cpp
template <typename... Args>
void print(Args... args)
{
    (std::cout << ... << args);
}
```

## Four Forms

```text
(args op ...)
(... op args)
(args op ... op init)
(init op ... op args)
```

## Important

Parentheses are part of the normal fold-expression syntax:

```cpp
(args + ...)
```

## Why Useful?

Before C++17, recursive template functions were commonly used to process parameter packs.

Fold expressions make many such operations much simpler.

## Interview Point

Fold expressions provide concise compile-time expansion of parameter packs using an operator.
