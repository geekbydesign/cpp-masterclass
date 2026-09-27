# `for` Loop

A `for` loop repeats a block of code while a condition remains true.

## 1. Basic Syntax

```cpp
for (initialization; condition; update)
{
    // body
}
```

Example:

```cpp
for (int i = 0; i < 5; ++i)
{
    std::cout << i << '\n';
}
```

Output:

```text
0
1
2
3
4
```

## 2. Execution Order

A `for` loop generally follows:

```text
initialization
      ↓
  condition
      ↓
    body
      ↓
   update
      ↓
  condition
      ↓
    ...
```

The initialization executes once.

The condition is checked before every iteration.

The update executes after the body of each completed iteration.

## 3. Loop Variable Scope

```cpp
for (int i = 0; i < 5; ++i)
{
    std::cout << i;
}

// i is not accessible here
```

The variable declared in the `for` initializer is scoped to the loop.

## 4. Multiple Expressions

The initializer and update sections can contain multiple expressions separated by the comma operator:

```cpp
for (int i = 0, j = 10; i < j; ++i, --j)
{
    std::cout << i << ' ' << j << '\n';
}
```

See `02-multiple-declarations.md` and `10-comma-operator-in-loops.md`.

## 5. Empty Parts

Any of the three parts can be omitted.

```cpp
int i = 0;

for (; i < 5; ++i)
{
}
```

Infinite loop:

```cpp
for (;;)
{
    // ...
}
```

## 6. Incrementing by More Than One

```cpp
for (int i = 0; i < 20; i += 2)
{
    std::cout << i << '\n';
}
```

## 7. Decrementing

```cpp
for (int i = 10; i > 0; --i)
{
    std::cout << i << '\n';
}
```

## 8. Reverse Iteration and Unsigned Types

Be careful with:

```cpp
for (std::size_t i = values.size() - 1; i >= 0; --i)
{
}
```

This can be wrong because `std::size_t` is unsigned and `i >= 0` is always true.

Prefer patterns that handle unsigned indices safely, or use an appropriate signed index when reverse indexing is required.

## 9. Best Practices

- Keep the loop condition easy to understand.
- Avoid modifying the loop-control variable unexpectedly inside the body.
- Use braces for non-trivial loops.
- Use range-based `for` when you simply need to traverse a range.

## Quick Revision

```cpp
for (initialization; condition; update)
{
    // body
}
```

## Interview Points

- Initialization runs once.
- Condition is checked before each iteration.
- Update runs after the body.
- The loop variable declared in the initializer is scoped to the loop.
