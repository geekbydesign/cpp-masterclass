# Function Objects

A function object, or functor, is an object that can be called like a function.

This is achieved by defining `operator()`.

```cpp
struct Add
{
    int operator()(int a, int b) const
    {
        return a + b;
    }
};

Add add;

int result = add(2, 3);
```

## Why function objects?

Unlike ordinary functions, function objects can store state.

```cpp
class Multiplier
{
    int factor;

public:
    explicit Multiplier(int f) : factor(f) {}

    int operator()(int value) const
    {
        return value * factor;
    }
};

Multiplier multiplyBy10(10);

int result = multiplyBy10(5); // 50
```

## Function objects and STL

They are commonly used with algorithms:

```cpp
std::sort(values.begin(), values.end(), Compare{});
```

## Stateful callable

```cpp
struct Counter
{
    int count = 0;

    void operator()()
    {
        ++count;
    }
};
```

The object stores persistent state between calls.

## Lambda relationship

A lambda is essentially a convenient way to create a unique function-object type.

```cpp
auto add = [](int a, int b)
{
    return a + b;
};
```

Conceptually similar to:

```cpp
struct Add
{
    int operator()(int a, int b) const
    {
        return a + b;
    }
};
```

## Key points

- Function objects overload `operator()`.
- They can hold state.
- They work naturally with STL algorithms.
- Lambdas provide a concise way to create function objects.
