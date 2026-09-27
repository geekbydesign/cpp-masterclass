# Comma Operator in Loops

The comma operator can evaluate multiple expressions in a `for` loop.

## 1. Basic Example

```cpp
for (int i = 0, j = 10;
     i < j;
     ++i, --j)
{
    std::cout << i << ' ' << j << '\n';
}
```

The update expression contains the built-in comma operator.

## 2. Evaluation Order

For the built-in comma operator, the left expression is evaluated before the right expression.

```cpp
++i, --j
```

means:

```text
increment i
then decrement j
```

## 3. Multiple Initialization

This:

```cpp
for (int i = 0, j = 10; i < j; ++i, --j)
{
}
```

contains two declarations in one declaration statement.

The comma separating `i` and `j` is not the comma operator.

## 4. Multiple Update Expressions

Here the commas are comma operators:

```cpp
for (int i = 0, j = 10;
     i < j;
     ++i, --j)
{
}
```

The update section is an expression containing the comma operator.

## 5. Two-Pointer Pattern

```cpp
for (int left = 0, right = n - 1;
     left < right;
     ++left, --right)
{
    compare(values[left], values[right]);
}
```

This is useful for:

- palindrome checks
- two-pointer algorithms
- reverse processing
- symmetric array operations

## 6. Readability

Use the comma operator when the expressions are clearly related.

Avoid:

```cpp
for (...; ...; updateA(), updateB(), updateC(), updateD())
{
}
```

if the update logic becomes difficult to understand.

A clearer loop body or helper function may be preferable.

## Quick Revision

```cpp
for (init; condition; expr1, expr2)
{
}
```

Built-in comma operator:

```text
evaluate expr1
then expr2
result = value of expr2
```

## Interview Point

The comma in a declaration and the comma operator are not the same thing. Context determines their meaning.
