# `switch` Scope

A `case` label does not automatically create a new scope.

## 1. Case Labels Share the Switch Block

This is problematic:

```cpp
switch (value)
{
case 1:
    int x = 10;
    std::cout << x;
    break;

case 2:
    int x = 20;
    std::cout << x;
    break;
}
```

The two declarations are in the same enclosing `switch` block scope.

## 2. Give Cases Their Own Blocks

Prefer:

```cpp
switch (value)
{
case 1:
{
    int x = 10;
    std::cout << x;
    break;
}

case 2:
{
    int x = 20;
    std::cout << x;
    break;
}
}
```

Now each `x` has its own block scope.

## 3. Initialization Across Cases

Avoid declarations whose initialization can be bypassed by jumping directly to another case.

For example:

```cpp
switch (value)
{
case 1:
    int x = 10;

case 2:
    std::cout << x;
    break;
}
```

Control can enter directly at `case 2`, so C++ has rules preventing certain jumps over initialization.

The clean solution is case-specific braces:

```cpp
switch (value)
{
case 1:
{
    int x = 10;
    std::cout << x;
    break;
}

case 2:
{
    std::cout << "Case 2";
    break;
}
}
```

## 4. Switch Initializer Scope

C++17:

```cpp
switch (int value = getValue(); value)
{
case 1:
    std::cout << value;
    break;

default:
    std::cout << value;
    break;
}
```

Here `value` is available throughout the `switch` statement.

## 5. Non-Trivial Objects

Braces are particularly useful when a case creates an object with a constructor/destructor:

```cpp
switch (command)
{
case Command::Start:
{
    Resource resource;
    start(resource);
    break;
}

case Command::Stop:
{
    stop();
    break;
}

default:
    break;
}
```

The case-local object's lifetime is then clearly tied to its block.

## 6. Fallthrough

Fallthrough affects control flow, not scope.

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

Use explicit documentation such as `[[fallthrough]]` when fallthrough is intentional.

## Quick Revision

```text
switch { ... }
    → common enclosing switch scope

case { ... }
    → explicit case-local scope
```

## Interview Points

- `case` does not automatically create a scope.
- Braces are useful for case-local variables.
- Control flow cannot bypass required initialization.
- `break` exits the switch; it does not create scope.
