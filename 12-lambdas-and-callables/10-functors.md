# Functors

A functor is a function object: an object that can be invoked using `()`.

```cpp
struct Square
{
    int operator()(int x) const
    {
        return x * x;
    }
};

Square square;

int result = square(5);
```

## Stateful functor

```cpp
struct GreaterThan
{
    int limit;

    bool operator()(int value) const
    {
        return value > limit;
    }
};

GreaterThan predicate{10};
```

The functor can retain configuration in its data members.

## Functors with STL algorithms

```cpp
std::count_if(values.begin(), values.end(),
              GreaterThan{10});
```

## Functor vs ordinary function

An ordinary function does not naturally carry per-object state.

A functor can:

```cpp
struct Adder
{
    int amount;

    int operator()(int value) const
    {
        return value + amount;
    }
};
```

Different objects can have different state:

```cpp
Adder add5{5};
Adder add10{10};
```

## Functor vs lambda

A named functor is useful when:

- logic is reused in many places
- state/configuration is needed
- the callable deserves a meaningful type/name
- implementation is large enough to deserve a separate class

A lambda is often better for short local behavior.

## Interview point

"Functor" and "function object" are commonly used interchangeably in C++ discussions.
