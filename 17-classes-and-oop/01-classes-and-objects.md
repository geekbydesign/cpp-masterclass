# Classes and Objects

A **class** is a user-defined type that combines data and behavior.

```cpp
class Car
{
public:
    void start()
    {
        // ...
    }

private:
    int speed = 0;
};
```

An **object** is an instance of a class:

```cpp
Car car;
car.start();
```

## Class members

A class can contain:

- data members
- member functions
- constructors
- destructors
- type aliases
- nested types
- static members

## Access control

```cpp
class Car
{
private:
    int speed;

public:
    void setSpeed(int value)
    {
        speed = value;
    }
};
```

`private` members are accessible only through permitted class/friend contexts.

## Object state and behavior

```cpp
class Counter
{
    int value = 0;

public:
    void increment()
    {
        ++value;
    }

    int getValue() const
    {
        return value;
    }
};
```

`value` represents state; `increment()` and `getValue()` provide behavior.

## Key points

- A class defines a type.
- An object is an instance of that type.
- Classes provide encapsulation.
- Access specifiers control member visibility.
