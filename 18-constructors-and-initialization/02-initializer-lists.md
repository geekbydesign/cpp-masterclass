# Initializer Lists

## What Is a Member Initializer List?

A member initializer list initializes data members before the constructor body executes.

```cpp
class Person
{
public:
    Person(const std::string& name, int age)
        : name(name), age(age)
    {
    }

private:
    std::string name;
    int age;
};
```

## Why Use It?

It is required or preferred for:

- `const` data members
- reference data members
- members without a default constructor
- base classes
- direct construction of members

```cpp
class Example
{
public:
    Example(int value)
        : value(value), ref(value)
    {
    }

private:
    const int value;
    int& ref;
};
```

## Initialization Order

Members are initialized in the order they are **declared in the class**, not the order written in the initializer list.

```cpp
class A
{
    int x;
    int y;

public:
    A() : y(10), x(y) {} // x is initialized first
};
```

Do not rely on the textual order of the initializer list.

## Interview Tip

Member initializer list means **initialization**, while assignments inside the constructor body are **assignment after initialization**.
