# Default Constructors

A default constructor is a constructor that can be called with no arguments.

```cpp
class Car
{
public:
    Car() {}
};

Car car;
```

## User-provided default constructor

```cpp
class Car
{
public:
    Car() : speed(0) {}

private:
    int speed;
};
```

## Compiler-generated default constructor

If you do not declare constructors, the compiler may implicitly declare a default constructor when the rules allow it.

```cpp
class Point
{
    int x = 0;
    int y = 0;
};

Point p;
```

## `= default`

You can explicitly request the compiler-generated version:

```cpp
class Point
{
public:
    Point() = default;
};
```

## Deleted default constructor

You can prevent default construction:

```cpp
class Resource
{
public:
    Resource() = delete;
};
```

Now:

```cpp
// Resource r; // Error
```

## Default member initializers

```cpp
class Point
{
    int x = 0;
    int y = 0;
};
```

These provide default initialization for members when the constructor does not explicitly initialize them.

## Important distinction

A default constructor is not necessarily a constructor with an empty body. It is a constructor that can be invoked with no arguments.

## Interview point

Know the difference between:

```cpp
T();
T() = default;
T() = delete;
```

and understand when the compiler implicitly declares or deletes special member functions.
