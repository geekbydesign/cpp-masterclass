# Debugging Arrays and Loops

Common array/loop bugs include:

- off-by-one errors
- out-of-bounds access
- incorrect loop conditions
- unexpected index values
- infinite loops

## Example

```cpp
int values[] = {10, 20, 30, 40, 50};

for (int i = 0; i <= 5; ++i)
{
    std::cout << values[i] << '\n';
}
```

Valid indexes are:

```text
0 1 2 3 4
```

`i == 5` is out of bounds.

## Breakpoint inside the loop

```cpp
for (int i = 0; i < 5; ++i)
{
    // breakpoint
    values[i] *= 2;
}
```

Inspect:

```text
i
values[i]
```

## Check loop boundaries

For `n` elements, the standard index pattern is:

```cpp
for (int i = 0; i < n; ++i)
```

Be careful with:

```cpp
i <= n
```

which usually accesses one element beyond the valid range.

## Useful watch expressions

```cpp
i
n
values[i]
```

For nested loops:

```cpp
row
column
matrix[row][column]
```

## Conditional breakpoint

If a bug appears at a specific iteration:

```cpp
i == 1000
```

Use a conditional breakpoint rather than stopping every time.

## Infinite loop

```cpp
int i = 0;

while (i < 10)
{
    // forgot ++i
}
```

Inspect `i`. If it never changes, the loop is not making progress.

## Off-by-one checklist

Check:

1. Initial index.
2. Loop condition.
3. Increment/decrement.
4. Maximum valid index.
5. Number of iterations.

## Range-based for

```cpp
for (int value : values)
{
    std::cout << value;
}
```

For modification:

```cpp
for (int& value : values)
{
    value *= 2;
}
```

## Interview point

For an array/loop bug, inspect the relationship between:

```text
index
valid range
loop condition
increment/decrement
array size
```
