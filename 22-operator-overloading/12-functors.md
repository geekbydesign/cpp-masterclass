# Functors

A functor, or function object, is an object that can be called like a function.

It overloads:

```cpp
operator()
```

## Example

```cpp
class Multiplier
{
public:
    explicit Multiplier(int factor)
        : factor(factor)
    {
    }

    int operator()(int value) const
    {
        return value * factor;
    }

private:
    int factor;
};
```

Usage:

```cpp
Multiplier times2{2};

std::cout << times2(5); // 10
```

## Why Functors?

A functor can store state.

```cpp
Multiplier times3{3};
```

A normal function pointer cannot naturally store this per-object state.

## With STL Algorithms

```cpp
std::vector<int> values{1, 2, 3};

Multiplier times2{2};

std::transform(
    values.begin(),
    values.end(),
    values.begin(),
    times2
);
```

## Lambda Relationship

A lambda is essentially a convenient way to create a callable object.

```cpp
auto times2 = [factor = 2](int value)
{
    return value * factor;
};
```

This is often more concise than writing a named functor.

## `const operator()`

If calling the functor should not modify its state:

```cpp
int operator()(int value) const;
```

This allows invocation through const functors.

## Interview Tip

Functor:

```text
object + operator()
```

This combines callable behavior with object state.
