# Inheritance Basics

Inheritance allows a derived class to reuse and extend a base class.

```cpp
class Person
{
public:
    void speak() {}
};

class Engineer : public Person
{
public:
    void design() {}
};
```

```cpp
Engineer e;
e.speak();
e.design();
```

## Terminology

```text
Person   -> base class
Engineer -> derived class
```

An `Engineer` object contains a `Person` base subobject.

## What Is Inherited?

A derived class inherits accessible base-class members, but:

- constructors are not automatically inherited
- destructors are not inherited
- private base members are not directly accessible

## Public Inheritance

```cpp
class Engineer : public Person {};
```

Public inheritance commonly represents an **is-a** relationship.

## Interview Tip

Inheritance establishes a type relationship as well as providing reuse. Use it when the derived type genuinely satisfies the base abstraction.
