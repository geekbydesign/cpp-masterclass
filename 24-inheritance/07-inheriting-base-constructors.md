# Inheriting Base Constructors

C++11 allows derived classes to inherit constructors with:

```cpp
using Base::Base;
```

Example:

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
    using Person::Person;
};
```

Now:

```cpp
Engineer e(30);
```

can use the inherited constructor.

## Important

Constructor inheritance does not copy the constructor body into the derived class. It makes the base constructor set available for constructing the derived type.

Derived members are initialized using their own default/member initialization.

```cpp
class Engineer : public Person
{
public:
    using Person::Person;

private:
    int employeeId{};
};
```

## Explicit Constructors

Properties such as `explicit` affect how an inherited constructor can be used.

## Difference

```cpp
using Base::Base;
```

inherits constructors.

```cpp
Derived(...) : Base(...) {}
```

defines a derived constructor explicitly.

## Interview Tip

Constructor inheritance is different from manually writing forwarding constructors.
