# `if-else`

`if` conditionally executes code when a condition is true.

## Basic `if`

```cpp
int age = 20;

if (age >= 18)
{
    std::cout << "Adult\n";
}
```

## `if-else`

```cpp
if (age >= 18)
{
    std::cout << "Adult\n";
}
else
{
    std::cout << "Minor\n";
}
```

Exactly one branch executes.

## Conditions

Conditions are contextually converted to `bool`.

```cpp
bool ready = true;

if (ready)
{
    // ...
}
```

Integral values also work:

```cpp
int value = 10;

if (value)
{
    // non-zero → true
}
```

## Nested `if`

```cpp
if (loggedIn)
{
    if (isAdmin)
    {
        std::cout << "Admin";
    }
}
```

Avoid excessive nesting when early returns or helper functions make the logic clearer.

## Common Pitfall

```cpp
if (x = 10) // assignment
{
}
```

If comparison is intended:

```cpp
if (x == 10)
{
}
```

## Best Practice

Prefer braces:

```cpp
if (condition)
{
    doSomething();
}
```

They reduce accidental bugs when code is later modified.

## Quick Revision

```cpp
if (condition)
{
    // true
}
else
{
    // false
}
```

## Interview Points

- Conditions are contextually converted to `bool`.
- `=` is assignment; `==` is comparison.
- `if` is runtime control flow.
- Braces are recommended for maintainability.
