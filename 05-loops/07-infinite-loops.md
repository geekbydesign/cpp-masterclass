# Infinite Loops

An infinite loop continues indefinitely unless something inside it changes the control flow or terminates the program.

## 1. Intentional Infinite `for`

```cpp
for (;;)
{
    // ...
}
```

## 2. Intentional Infinite `while`

```cpp
while (true)
{
    // ...
}
```

Both are common ways to express an intentional infinite loop.

## 3. Exit With `break`

```cpp
while (true)
{
    if (shouldStop())
        break;

    process();
}
```

## 4. Event/Service Loops

Long-running applications may intentionally use loops such as:

```cpp
while (running)
{
    processNextEvent();
}
```

The loop terminates when `running` becomes false.

## 5. Accidental Infinite Loop

Example:

```cpp
int i = 0;

while (i < 10)
{
    std::cout << i;
}
```

`i` never changes, so the condition remains true.

Correct:

```cpp
while (i < 10)
{
    std::cout << i;
    ++i;
}
```

## 6. Unsigned Reverse Loop Trap

This can become infinite:

```cpp
for (std::size_t i = values.size() - 1; i >= 0; --i)
{
}
```

`std::size_t` is unsigned, so `i >= 0` is always true.

Use a safe reverse-iteration pattern instead.

## 7. Empty Loop Body

An accidental semicolon can create an empty loop:

```cpp
while (condition);
{
    process();
}
```

The `while` controls the empty statement, not the block below it.

Be careful with stray semicolons.

## 8. Debugging Infinite Loops

Check:

1. What makes the condition true?
2. What makes it false?
3. Is the controlling state updated?
4. Can integer overflow/wraparound prevent termination?
5. Does `continue` skip the update?
6. Is the condition accidentally constant?

## Quick Revision

```text
Intentional:
while (true)
{
    ...
}

Accidental:
condition never becomes false
```

## Interview Point

An infinite loop is not automatically a bug. Server loops, event loops, and embedded systems can intentionally run until shutdown.
