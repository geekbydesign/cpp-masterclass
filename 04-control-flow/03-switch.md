# `switch`

`switch` selects among branches based on an integral or enumeration expression.

## Basic Syntax

```cpp
int option = 2;

switch (option)
{
case 1:
    std::cout << "One";
    break;

case 2:
    std::cout << "Two";
    break;

default:
    std::cout << "Other";
    break;
}
```

## `case`

Each `case` specifies a constant value to match.

```cpp
case 1:
```

## `break`

Without `break`, execution can continue into the next case.

```cpp
switch (value)
{
case 1:
    std::cout << "One";

case 2:
    std::cout << "Two";
}
```

If `value == 1`, both outputs can execute. This is **fallthrough**.

## Intentional Fallthrough

C++17 provides:

```cpp
[[fallthrough]];
```

Example:

```cpp
switch (value)
{
case 1:
    prepare();
    [[fallthrough]];

case 2:
    process();
    break;
}
```

## `default`

```cpp
default:
    // no case matched
    break;
```

`default` is optional.

## Multiple Cases

```cpp
switch (grade)
{
case 'A':
case 'B':
    std::cout << "Good";
    break;

case 'C':
    std::cout << "Average";
    break;

default:
    std::cout << "Other";
}
```

## Enum Example

```cpp
enum class State
{
    Idle,
    Running,
    Error
};

switch (state)
{
case State::Idle:
    break;

case State::Running:
    break;

case State::Error:
    break;
}
```

## `switch` vs `if-else`

Use `switch` for discrete constant values.

Use `if-else` for ranges or complex boolean conditions.

## Quick Revision

```text
switch  → expression
case    → matching value
break   → exit switch
default → no case matched
```

## Interview Points

- `case` labels must be constant expressions.
- Missing `break` can cause fallthrough.
- `[[fallthrough]]` documents intentional fallthrough.
- A `case` label does not automatically create a scope.
