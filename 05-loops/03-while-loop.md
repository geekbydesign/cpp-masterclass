# `while` Loop

A `while` loop repeats a block while its condition is true.

## 1. Syntax

```cpp
while (condition)
{
    // body
}
```

Example:

```cpp
int count = 0;

while (count < 5)
{
    std::cout << count << '\n';
    ++count;
}
```

## 2. Condition Checked First

The condition is checked before every iteration.

Therefore the body may execute zero times:

```cpp
int count = 10;

while (count < 5)
{
    std::cout << count;
}
```

Nothing is printed.

## 3. Update Is Your Responsibility

Unlike a `for` loop, `while` has no built-in update expression.

```cpp
while (condition)
{
    // change state
}
```

Forgetting to update the condition can create an infinite loop.

## 4. Reading Until a Condition

```cpp
int value;

while (std::cin >> value)
{
    process(value);
}
```

The loop continues while input succeeds.

## 5. `while` vs `for`

Use `while` when the loop is naturally described as:

> Continue while this condition is true.

Example:

```cpp
while (!queue.empty())
{
    process(queue.front());
    queue.pop();
}
```

Use `for` when initialization, condition, and update form a clear iteration pattern.

## 6. Infinite `while`

```cpp
while (true)
{
    // ...
}
```

Usually there should be a clear exit condition:

```cpp
while (true)
{
    if (shouldStop())
        break;

    process();
}
```

## 7. Scope

Variables declared in a surrounding block remain available to the loop:

```cpp
int count = 0;

while (count < 5)
{
    ++count;
}
```

A variable declared inside the body belongs to that iteration's block scope:

```cpp
while (condition)
{
    int value = getValue();
}
```

## Quick Revision

```cpp
while (condition)
{
    // repeated while true
}
```

The condition is checked before each iteration.

## Interview Points

- A `while` loop can execute zero times.
- The loop condition must eventually become false unless an intentional infinite loop is used.
- The programmer is responsible for updating loop state.
