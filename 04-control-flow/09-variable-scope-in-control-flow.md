# Variable Scope in Control Flow

Scope defines where a name can be used. Control-flow statements create useful narrow scopes.

## `if` Init-Statement

```cpp
if (auto value = getValue(); value > 0)
{
    std::cout << value;
}
```

`value` is available in the condition and controlled branches, but not afterward.

## Block Scope

```cpp
if (condition)
{
    int value = 10;
    std::cout << value;
}

// value is not accessible here
```

## Nested Scope

```cpp
int value = 10;

if (condition)
{
    int other = 20;

    {
        int inner = 30;

        std::cout << value;
        std::cout << other;
        std::cout << inner;
    }

    std::cout << value;
    std::cout << other;

    // inner is not accessible
}
```

Inner scopes can access names from enclosing scopes, subject to normal name lookup and access rules.

## Shadowing

```cpp
int value = 10;

if (condition)
{
    int value = 20;

    std::cout << value; // 20
}
```

The inner declaration hides the outer name.

## `for` Loop Scope

```cpp
for (int i = 0; i < 10; ++i)
{
    std::cout << i;
}

// i is not accessible here
```

## `switch` Init-Statement

```cpp
switch (auto value = getValue(); value)
{
case 1:
    std::cout << value;
    break;

default:
    break;
}
```

`value` is scoped to the `switch` statement.

## Why Narrow Scope Matters

Keeping variables close to their use:

- reduces accidental use
- reduces name collisions
- improves readability
- makes lifetime easier to understand
- works well with RAII

## Scope vs Lifetime

Do not confuse them.

```text
Scope   → where the name can be used
Lifetime → how long the object exists
```

## Quick Revision

```text
if initializer → if statement scope
for initializer → for statement scope
switch initializer → switch statement scope
block variable → enclosing block scope
