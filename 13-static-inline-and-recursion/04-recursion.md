# Recursion

Recursion occurs when a function directly or indirectly calls itself.

```cpp
int factorial(int n)
{
    if (n <= 1)
        return 1;

    return n * factorial(n - 1);
}
```

## Two essential parts

Every useful recursive solution needs:

1. **Base case** — stops recursion.
2. **Recursive case** — moves toward the base case.

```cpp
int factorial(int n)
{
    if (n == 0)          // base case
        return 1;

    return n * factorial(n - 1); // recursive case
}
```

## Call stack

Each recursive call creates a new stack frame containing the function's local state and parameters.

For:

```cpp
factorial(3)
```

the calls are conceptually:

```text
factorial(3)
    factorial(2)
        factorial(1)
            factorial(0)
```

Then the calls return in reverse order.

## Missing base case

```cpp
void bad()
{
    bad();
}
```

This eventually causes stack exhaustion / stack overflow.

## Recursive vs iterative

Factorial can also be written iteratively:

```cpp
int factorial(int n)
{
    int result = 1;

    for (int i = 2; i <= n; ++i)
        result *= i;

    return result;
}
```

Recursion can make tree, graph, divide-and-conquer, and backtracking algorithms easier to express, but it can add call-stack overhead.

## Tail recursion

A recursive call is tail-recursive when it is the final operation:

```cpp
int sum(int n, int acc)
{
    if (n == 0)
        return acc;

    return sum(n - 1, acc + n);
}
```

C++ does not require tail-call optimization, so you should not assume tail recursion eliminates stack usage.

## Common recursive patterns

- factorial
- Fibonacci
- tree traversal
- divide and conquer
- backtracking
- DFS
- recursive descent parsing

## Interview checklist

For every recursive function, ask:

1. What is the base case?
2. Does every path eventually reach it?
3. Does the input move toward the base case?
4. What is the time complexity?
5. What is the recursion depth / stack complexity?
