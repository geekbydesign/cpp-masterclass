# `else-if`

`else if` tests multiple mutually exclusive conditions in sequence.

## Basic Example

```cpp
int score = 75;

if (score >= 90)
{
    std::cout << "A";
}
else if (score >= 80)
{
    std::cout << "B";
}
else if (score >= 70)
{
    std::cout << "C";
}
else
{
    std::cout << "D";
}
```

Conditions are evaluated from top to bottom.

## First Matching Branch

Once a condition is true, the remaining `else if` and `else` branches are skipped.

## Ordering Matters

This is problematic:

```cpp
if (score >= 50)
{
    std::cout << "Pass";
}
else if (score >= 90)
{
    std::cout << "Excellent";
}
```

The second condition is unreachable for scores `>= 90`.

Prefer:

```cpp
if (score >= 90)
{
    std::cout << "Excellent";
}
else if (score >= 50)
{
    std::cout << "Pass";
}
```

## `else-if` vs Separate `if`

With `else-if`, at most one branch executes:

```cpp
if (x > 0)
{
}
else if (x > 10)
{
}
```

With separate `if` statements, both can execute:

```cpp
if (x > 0)
{
}

if (x > 10)
{
}
```

## Quick Revision

```text
if
 ↓ false
else if
 ↓ false
else
```

Only the first matching branch executes.

## Interview Point

The order of `else-if` conditions matters because evaluation stops after the first true condition.
