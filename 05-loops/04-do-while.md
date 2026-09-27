# `do-while` Loop

A `do-while` loop executes its body first and checks the condition afterward.

## 1. Syntax

```cpp
do
{
    // body
}
while (condition);
```

Note the semicolon after the condition.

## 2. At Least One Iteration

```cpp
int count = 10;

do
{
    std::cout << count << '\n';
}
while (count < 5);
```

The body executes once even though the condition is initially false.

## 3. Comparison

### `while`

```cpp
while (condition)
{
    // may execute zero times
}
```

### `do-while`

```cpp
do
{
    // executes at least once
}
while (condition);
```

## 4. Typical Use

A menu that must be displayed at least once:

```cpp
int choice;

do
{
    std::cout << "1. Start\n";
    std::cout << "2. Exit\n";

    std::cin >> choice;

} while (choice != 2);
```

## 5. Update State

As with `while`, make sure the condition can eventually change:

```cpp
do
{
    ++count;
}
while (count < 5);
```

## 6. Scope

Variables declared inside the body are scoped to the body:

```cpp
do
{
    int value = getValue();
}
while (condition);

// value is unavailable here
```

## Quick Revision

```text
while
    condition → body

do-while
    body → condition
```

## Interview Point

The key difference is that `do-while` guarantees at least one execution of the loop body.
