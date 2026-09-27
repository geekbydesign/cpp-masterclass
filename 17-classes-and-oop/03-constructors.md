# Constructors

A constructor initializes an object when it is created.

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

Point p(10, 20);
```

## Constructor characteristics

A constructor:

- has the same name as the class
- has no return type
- runs during object initialization
- can be overloaded

## Constructor overloading

```cpp
class Point
{
public:
    Point() : x(0), y(0) {}

    Point(int xValue, int yValue)
        : x(xValue), y(yValue) {}

private:
    int x;
    int y;
};
```

## Initialization list

Prefer member initializer lists:

```cpp
Point(int xValue)
    : x(xValue)
{
}
```

rather than assigning in the constructor body:

```cpp
Point(int xValue)
{
    x = xValue;
}
```

Members are initialized before the constructor body executes.

## `explicit`

Single-argument constructors can cause implicit conversions:

```cpp
class Number
{
public:
    Number(int value);
};
```

Prefer `explicit` when implicit conversion is not intended:

```cpp
explicit Number(int value);
```

## Delegating constructors

C++11 allows one constructor to delegate to another:

```cpp
class Point
{
public:
    Point() : Point(0, 0) {}

    Point(int x, int y)
        : x(x), y(y) {}

private:
    int x;
    int y;
};
```

## Interview point

Constructor initialization happens before the constructor body. Member initializer order follows **declaration order**, not the order written in the initializer list.
