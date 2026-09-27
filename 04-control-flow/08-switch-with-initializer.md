# `switch` With Initializer

C++17 allows an initializer in a `switch` statement.

## Syntax

```cpp
switch (initializer; condition)
{
    // cases
}
```

Example:

```cpp
switch (int value = getValue(); value)
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

## Scope

The initializer variable is available throughout the `switch` statement:

```cpp
switch (auto state = getState(); state)
{
case 1:
    std::cout << state;
    break;

default:
    std::cout << state;
    break;
}
```

After the `switch`, `state` is no longer accessible.

## Enum Example

```cpp
enum class State
{
    Idle,
    Running,
    Error
};

switch (State state = getState(); state)
{
case State::Idle:
    break;

case State::Running:
    break;

case State::Error:
    break;
}
```

## Why Use It?

It keeps a temporary result local to the dispatch statement:

```cpp
switch (auto command = readCommand(); command)
{
case Command::Start:
    start();
    break;

case Command::Stop:
    stop();
    break;

default:
    break;
}
```

## C++ Version

```text
C++17
```

## Quick Revision

```cpp
switch (initializer; condition)
{
    ...
}
```

The initializer is scoped to the `switch` statement.
