# `break` and `continue`

`break` exits a loop immediately.

`continue` skips the rest of the current iteration and starts the next iteration.

## 1. `break`

```cpp
for (int i = 0; i < 10; ++i)
{
    if (i == 5)
        break;

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

## 2. `continue`

```cpp
for (int i = 0; i < 5; ++i)
{
    if (i == 2)
        continue;

    std::cout << i << '\n';
}
```

Output:

```text
0
1
3
4
```

## 3. `continue` in a `for` Loop

The update expression still executes after `continue`.

```cpp
for (int i = 0; i < 5; ++i)
{
    if (i == 2)
        continue;

    std::cout << i;
}
```

After `continue`, execution goes to:

```text
update → condition
```

not directly to the body again.

## 4. `continue` in a `while` Loop

There is no automatic update expression:

```cpp
while (condition)
{
    if (skip)
        continue;

    updateState();
}
```

This can create an infinite loop if `continue` skips the code responsible for changing `condition`.

## 5. Nested Loops

`break` exits only the nearest enclosing loop.

```cpp
for (int i = 0; i < 3; ++i)
{
    for (int j = 0; j < 3; ++j)
    {
        if (j == 1)
            break;

        std::cout << j;
    }
}
```

The outer loop continues.

## 6. `break` in `switch`

`break` also exits a `switch`:

```cpp
switch (value)
{
case 1:
    process();
    break;

default:
    break;
}
```

## 7. Avoid Deeply Nested Control Flow

If multiple levels need to be exited, consider:

- a helper function
- an early `return`
- a clear state variable
- restructuring the algorithm

Avoid complicated control flow that is difficult to maintain.

## Quick Revision

```text
break
    → exit nearest loop/switch

continue
    → skip current iteration
```

## Interview Point

In a `for` loop, `continue` still executes the loop's update expression before the next condition check.
