# Initializer List vs Memberwise Initialization

## Initializer List

```cpp
class Person
{
public:
    Person(std::string n, int a)
        : name(std::move(n)), age(a)
    {
    }

private:
    std::string name;
    int age;
};
```

Members are directly initialized.

## Assignment in Constructor Body

```cpp
Person(std::string n, int a)
{
    name = std::move(n);
    age = a;
}
```

Here members are initialized first and then assigned new values.

## Why Initializer Lists Are Better

For class-type members:

```cpp
class Employee
{
    std::string name;

public:
    Employee(const std::string& n)
        : name(n)
    {
    }
};
```

This constructs `name` directly.

With assignment:

1. `name` is default-constructed.
2. `name` is assigned a new value.

## Required Cases

Initializer lists are necessary for:

```cpp
const int id;
int& ref;
Member member; // if Member has no default constructor
```

## Rule

Prefer initializer lists for member initialization.

## Interview Question

**Does initializer-list order control initialization order?**

No. Declaration order controls initialization order.
