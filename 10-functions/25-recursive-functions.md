# Recursive Functions

A recursive function calls itself.

Every correct recursion needs:

1. Base case.
2. Recursive case that moves toward the base case.

```cpp
int factorial(int n)
{
    if (n <= 1)
        return 1;

    return n * factorial(n - 1);
}
```

## Call Stack

For:

```cpp
factorial(3)
```

conceptually:

```text
factorial(3)
  -> factorial(2)
      -> factorial(1)
```

Each call consumes stack space.

## Common Uses

- Tree traversal.
- Divide and conquer.
- Backtracking.
- Mathematical definitions.

## Risks

Deep recursion can cause stack exhaustion.

Some recursive algorithms can also have exponential time complexity if overlapping work is not optimized.

**Interview:** Always identify the base case and calculate time/space complexity.
