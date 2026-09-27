# Nested Loops

A nested loop is a loop inside another loop.

## 1. Basic Example

```cpp
for (int i = 0; i < 3; ++i)
{
    for (int j = 0; j < 3; ++j)
    {
        std::cout << i << ',' << j << '\n';
    }
}
```

The inner loop runs completely for each outer-loop iteration.

## 2. Execution

For:

```cpp
for (int i = 0; i < 3; ++i)
{
    for (int j = 0; j < 3; ++j)
    {
    }
}
```

The inner loop runs:

```text
3 × 3 = 9
```

times.

## 3. Time Complexity

If both loops iterate `n` times:

```cpp
for (...)
{
    for (...)
    {
    }
}
```

the typical time complexity is:

```text
O(n²)
```

But the exact complexity depends on the bounds of both loops.

## 4. Matrix Traversal

```cpp
int matrix[3][3]{};

for (int row = 0; row < 3; ++row)
{
    for (int col = 0; col < 3; ++col)
    {
        matrix[row][col] = row + col;
    }
}
```

## 5. Triangle Pattern

```cpp
for (int row = 1; row <= 5; ++row)
{
    for (int col = 0; col < row; ++col)
    {
        std::cout << '*';
    }

    std::cout << '\n';
}
```

## 6. `break` in Nested Loops

A `break` exits only the nearest loop:

```cpp
for (int i = 0; i < 3; ++i)
{
    for (int j = 0; j < 3; ++j)
    {
        if (j == 1)
            break;
    }

    // outer loop continues
}
```

## 7. Searching a Matrix

```cpp
bool found = false;

for (int row = 0; row < rows && !found; ++row)
{
    for (int col = 0; col < cols; ++col)
    {
        if (matrix[row][col] == target)
        {
            found = true;
            break;
        }
    }
}
```

## 8. Complexity Awareness

Nested loops do not automatically mean `O(n²)`.

Example:

```cpp
for (int i = 0; i < n; ++i)
{
    for (int j = 0; j < 10; ++j)
    {
    }
}
```

is:

```text
O(n)
```

because the inner loop has constant size.

## Quick Revision

```text
outer iteration
    ↓
inner loop runs completely
    ↓
next outer iteration
```

## Interview Points

- Analyze actual loop bounds rather than simply counting nesting levels.
- `break` exits the nearest loop.
- Nested loops are common in matrix and brute-force algorithms.
