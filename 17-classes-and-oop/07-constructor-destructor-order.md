# Constructor and Destructor Order

Understanding initialization and destruction order is essential in C++.

## Construction order

For a derived object, construction happens in this order:

1. virtual base classes
2. direct base classes
3. non-static data members
4. constructor body

For a class without inheritance:

1. data members are initialized in declaration order
2. constructor body runs

Example:

```cpp
class Example
{
    int first;
    int second;

public:
    Example()
        : second(2), first(1)
    {
    }
};
```

`first` is initialized before `second` because that is their declaration order.

## Destruction order

Destruction is approximately the reverse:

1. destructor body
2. members in reverse declaration order
3. direct bases in reverse order
4. virtual bases

## Member initializer list order

Do not rely on the order written here:

```cpp
Example()
    : second(2), first(1)
{
}
```

The actual order is still:

```text
first
second
```

## Why order matters

A member may depend on another member:

```cpp
class Example
{
    int first;
    int second;

public:
    Example()
        : second(first), first(10)
    {
    }
};
```

`second` is initialized after `first` despite the initializer-list order.

## Interview checklist

Remember:

```text
Construction:
base → members → body

Destruction:
body → members → base
```

Members follow declaration order during construction and reverse declaration order during destruction.
