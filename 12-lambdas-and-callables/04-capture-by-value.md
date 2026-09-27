# Capture by Value

Capture by value stores a copy of the captured variable inside the lambda object.

```cpp
int x = 10;

auto f = [x]()
{
    std::cout << x;
};

x = 20;

f(); // prints 10
```

The lambda has its own copy.

## Multiple variables

```cpp
int a = 10;
int b = 20;

auto sum = [a, b]()
{
    return a + b;
};
```

## Modifying the captured copy

By default, the lambda's `operator()` is effectively const with respect to its captured data.

```cpp
int x = 10;

auto f = [x]()
{
    // ++x; // Error
};
```

Use `mutable`:

```cpp
auto f = [x]() mutable
{
    ++x;
};
```

This changes only the lambda's internal copy.

## Original variable is unchanged

```cpp
int x = 10;

auto f = [x]() mutable
{
    ++x;
};

f();

std::cout << x; // 10
```

## Lifetime advantage

A value capture owns its copied state, so it can be safer than a reference capture when the lambda needs to outlive the original local variable.

However, copying an object can be expensive or may capture a snapshot when the latest value was intended.

## Interview point

`[x]` means the lambda captures a copy of `x`, not a reference to `x`.
