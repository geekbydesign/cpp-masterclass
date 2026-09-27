# Member Initialization

Non-static data members should be initialized using member initializer lists or default member initializers.

## Member initializer list

```cpp
class Point
{
    int x;
    int y;

public:
    Point(int xValue, int yValue)
        : x(xValue), y(yValue)
    {
    }
};
```

## Default member initializers

C++11 allows:

```cpp
class Point
{
    int x = 0;
    int y = 0;
};
```

These provide default initialization when a constructor does not specify another initializer.

## Initialization order

Members are initialized in the order they are **declared**, not the order listed in the constructor.

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

Actual order:

```text
first
second
constructor body
```

## Why initializer lists matter

Some members must be initialized rather than assigned:

### Reference members

```cpp
class Example
{
    int& ref;

public:
    Example(int& value)
        : ref(value)
    {
    }
};
```

### Const members

```cpp
class Example
{
    const int value;

public:
    Example(int x)
        : value(x)
    {
    }
};
```

### Member objects without default constructors

```cpp
class Engine
{
public:
    Engine(int power);
};

class Car
{
    Engine engine;

public:
    Car()
        : engine(100)
    {
    }
};
```

## Initialization vs assignment

This:

```cpp
Car(int x)
    : value(x)
{
}
```

initializes `value`.

This:

```cpp
Car(int x)
{
    value = x;
}
```

first initializes `value` somehow, then assigns to it.

The initializer list is generally the correct approach.

## Avoid initialization-order bugs

Always order the initializer list consistently with member declaration order.

## Interview checklist

Remember:

1. Members initialize before constructor body.
2. Initialization follows declaration order.
3. Initializer-list order does not control actual order.
4. `const`, reference, and certain class-type members require initialization.
5. Prefer default member initializers for sensible defaults.
