# Short-Circuit Evaluation

The built-in logical `&&` and `||` operators can skip evaluation of their right operand.

## Logical AND

For:

```cpp
A && B
```

if `A` is false, the result is already false, so `B` is not evaluated.

```cpp
if (ptr != nullptr && *ptr == 42)
{
}
```

If `ptr == nullptr`, the dereference is skipped.

## Logical OR

For:

```cpp
A || B
```

if `A` is true, the result is already true, so `B` is not evaluated.

```cpp
if (isCached || loadFromDatabase())
{
}
```

If `isCached` is true, `loadFromDatabase()` is not called.

## Evaluation Order

For the built-in logical operators, the left operand is evaluated first.

This makes guard conditions possible:

```cpp
if (index >= 0 &&
    index < size &&
    values[index] == target)
{
}
```

The array access is reached only if the earlier conditions succeed.

## `&` vs `&&`

```cpp
a & b
```

is bitwise AND.

```cpp
a && b
```

is logical AND with short-circuit behavior.

Similarly:

```cpp
a | b
a || b
```

are bitwise OR and logical OR respectively.

## Side Effects

Be careful with side effects:

```cpp
if (ready && initialize())
{
}
```

`initialize()` runs only when `ready` is true.

Do not hide important program behavior inside unnecessarily complex conditions.

## Quick Revision

```text
A && B
    A false → B skipped

A || B
    A true  → B skipped
```

## Interview Point

Short-circuiting is part of the semantics of the built-in logical `&&` and `||` operators, not merely an optimization.
