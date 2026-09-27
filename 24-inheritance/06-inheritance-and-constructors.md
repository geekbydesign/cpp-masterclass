# Inheritance and Constructors

When a derived object is constructed, its base subobject is constructed first.

```cpp
class Person
{
public:
    Person(int age) : age(age) {}

private:
    int age;
};

class Engineer : public Person
{
public:
    Engineer(int age, int id)
        : Person(age), id(id)
    {}

private:
    int id;
};
```

Construction order:

```text
Person constructor
      ↓
Engineer members
      ↓
Engineer constructor body
```

## Base Initialization

A derived constructor initializes its **direct base**:

```cpp
Engineer(int age, int id)
    : Person(age), id(id)
{}
```

If the base has no default constructor, the derived constructor must select an appropriate base constructor.

## Multi-Level Inheritance

```cpp
class Person {};
class Engineer : public Person {};
class CivilEngineer : public Engineer {};
```

Creating `CivilEngineer` constructs:

```text
Person
  ↓
Engineer
  ↓
CivilEngineer
```

The `CivilEngineer` constructor directly initializes `Engineer`, not `Person`.

## Destruction

Destruction happens in reverse order:

```text
CivilEngineer
  ↓
Engineer
  ↓
Person
```

## Interview Tip

A constructor initializes its **direct bases and its own members**. Each class is responsible for its own direct base.
