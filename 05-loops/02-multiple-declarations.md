# Multiple Declarations in Loops

C++ allows multiple declarations in a `for` loop initializer when they are part of the same declaration.

## 1. Multiple Variables

```cpp
for (int i = 0, j = 10; i < j; ++i, --j)
{
    std::cout << i << ' ' << j << '\n';
}
```

Here `i` and `j` are declared in the same initializer.

## 2. Same Type

The common form is:

```cpp
for (int i = 0, j = 10; i < j; ++i, --j)
{
}
```

Both variables have type `int`.

## 3. Different Types

A single declaration cannot generally declare variables of unrelated types using one type specifier:

```cpp
// for (int i = 0, double d = 1.0; ... ) // invalid
```

If different types are needed, declare them before the loop or redesign the loop.

## 4. Multiple Update Expressions

The third part of a `for` statement is an expression and can use the comma operator:

```cpp
for (int i = 0, j = 10; i < j; ++i, --j)
{
}
```

The update performs:

```cpp
++i;
--j;
```

in left-to-right order for the built-in comma operator.

## 5. Example: Two-Pointer Pattern

```cpp
for (int left = 0, right = n - 1;
     left < right;
     ++left, --right)
{
    // process from both ends
}
```

This pattern is common in array/string algorithms.

## 6. Scope

Both variables have scope associated with the `for` statement:

```cpp
for (int i = 0, j = 10; i < j; ++i, --j)
{
    // i and j available
}

// i and j unavailable here
```

## 7. Keep It Readable

Multiple loop variables can be useful when they express one clear relationship.

Avoid overly complicated loops:

```cpp
for (int i = 0, j = 10; i < j; ++i, --j)
{
    // many unrelated operations
}
```

If the logic becomes difficult to understand, use a clearer structure.

## Quick Revision

```cpp
for (int i = 0, j = 10;
     i < j;
     ++i, --j)
{
}
```

- `i` and `j` are declared together.
- Both are scoped to the loop.
- The comma in the update is the comma operator.

## Interview Point

Do not confuse the comma used to declare multiple variables with the comma operator used to evaluate multiple expressions.
