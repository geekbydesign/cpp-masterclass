# Common Loop Patterns

Loop patterns are reusable ways of structuring iteration.

## 1. Count From Zero

```cpp
for (int i = 0; i < n; ++i)
{
    process(i);
}
```

Common for array/vector indexing.

## 2. Count From One

```cpp
for (int i = 1; i <= n; ++i)
{
    process(i);
}
```

Useful when the problem is naturally 1-based.

## 3. Accumulation

```cpp
int sum = 0;

for (int value : values)
{
    sum += value;
}
```

Pattern:

```text
initialize accumulator
→ visit each element
→ update accumulator
```

## 4. Counting

```cpp
int count = 0;

for (int value : values)
{
    if (value > 0)
        ++count;
}
```

## 5. Find First Match

```cpp
int result = -1;

for (int i = 0; i < n; ++i)
{
    if (values[i] == target)
    {
        result = i;
        break;
    }
}
```

## 6. Check All Elements

```cpp
bool valid = true;

for (int value : values)
{
    if (!isValid(value))
    {
        valid = false;
        break;
    }
}
```

## 7. Transform Elements

```cpp
for (auto& value : values)
{
    value *= 2;
}
```

This modifies every element.

## 8. Reverse Traversal

Using iterators:

```cpp
for (auto it = values.rbegin();
     it != values.rend();
     ++it)
{
    process(*it);
}
```

## 9. Two Pointers

```cpp
int left = 0;
int right = n - 1;

while (left < right)
{
    process(values[left], values[right]);

    ++left;
    --right;
}
```

## 10. Nested Matrix Traversal

```cpp
for (int row = 0; row < rows; ++row)
{
    for (int col = 0; col < cols; ++col)
    {
        process(matrix[row][col]);
    }
}
```

## 11. Read Until Input Ends

```cpp
int value;

while (std::cin >> value)
{
    process(value);
}
```

The stream's state controls termination.

## 12. Search With Early Exit

```cpp
for (const auto& value : values)
{
    if (matches(value))
        break;
}
```

Avoid continuing work after the answer is known.

## 13. Skip Invalid Elements

```cpp
for (const auto& value : values)
{
    if (!isValid(value))
        continue;

    process(value);
}
```

## 14. Frequency Counting

For a small fixed range of values:

```cpp
std::vector<int> frequency(10, 0);

for (int value : values)
{
    ++frequency[value];
}
```

This pattern is useful when the value range is known and small.

## 15. Loop Invariant Thinking

A loop invariant is a property that remains true at key points of every iteration.

Example:

```cpp
int sum = 0;

for (int i = 0; i < n; ++i)
{
    sum += values[i];
}
```

At the start of each iteration, `sum` represents the sum of elements processed so far.

Thinking in terms of invariants helps with:

- correctness
- debugging
- algorithm design
- interview explanations

## 16. Avoid Off-by-One Errors

Compare:

```cpp
i < n
```

with:

```cpp
i <= n
```

For a zero-based array with `n` elements, the valid indices are:

```text
0 ... n-1
```

Therefore:

```cpp
for (int i = 0; i < n; ++i)
```

is the normal pattern.

## Quick Revision

Common patterns:

```text
counting
accumulation
search
counting matches
validation
transformation
reverse traversal
two pointers
nested traversal
early exit
skip with continue
```

## Interview Checklist

When writing a loop, ask:

1. What is the initialization?
2. What is the termination condition?
3. What changes each iteration?
4. Can the loop become infinite?
5. Are the bounds inclusive or exclusive?
6. Is there an off-by-one error?
7. Can the answer be found early?
8. What is the time complexity?
9. Are signed/unsigned types involved?
10. Would a range-based loop or STL algorithm make the intent clearer?
