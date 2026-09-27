# OOP Interview Questions

## 1. What are the four commonly discussed OOP principles?

```text
Encapsulation
Abstraction
Inheritance
Polymorphism
```

## 2. What is encapsulation?

Bundling data and operations together while controlling access to implementation details.

```cpp
class Account
{
private:
    double balance;

public:
    void deposit(double amount);
};
```

## 3. What is abstraction?

Expose the relevant interface while hiding unnecessary implementation details.

## 4. What is inheritance?

A derived class acquires/inherits members and behavior from a base class.

```cpp
class Dog : public Animal
{
};
```

## 5. What is polymorphism?

The same interface can represent different behavior.

Runtime example:

```cpp
Animal* a = new Dog;
a->speak();
```

if `speak()` is virtual.

## 6. What is the constructor order?

For:

```text
Derived
 ├── Base
 └── members
```

Construction order:

```text
virtual bases
→ direct bases
→ data members in declaration order
→ derived constructor body
```

Destruction occurs in reverse order.

## 7. Can a derived constructor directly initialize an indirect base?

No.

If:

```text
Person
  ↑
Engineer
  ↑
CivilEngineer
```

`CivilEngineer` directly initializes `Engineer`.

`Engineer` initializes `Person`.

```cpp
Engineer::Engineer()
    : Person(value)
{
}

CivilEngineer::CivilEngineer()
    : Engineer(value)
{
}
```

## 8. What is function hiding?

A derived declaration can hide all base overloads with the same name.

```cpp
struct Base
{
    void process(int);
    void process(double);
};

struct Derived : Base
{
    void process(int);
};
```

`using Base::process;` can bring the base overloads into scope.

## 9. Overriding vs overloading?

```text
overloading → same scope/name, different parameter lists
overriding  → derived class replaces a virtual base function
```

Use `override` to make the intent explicit.

## 10. What is a pure virtual function?

```cpp
virtual void run() = 0;
```

It makes the class abstract when appropriate.

## 11. What is an abstract class?

A class that cannot be instantiated, typically because it has at least one pure virtual function.

## 12. Why use a virtual destructor?

To safely destroy derived objects through a base pointer when polymorphic deletion is intended.

## 13. What is object slicing?

Copying a derived object into a base object by value removes the derived portion.

## 14. What is composition vs inheritance?

```text
inheritance → "is-a"
composition → "has-a"
```

Prefer composition when behavior can be assembled from collaborating objects instead of forming a true subtype relationship.

## 15. What is a friend function?

A non-member function granted access to private/protected members.

Friendship is not inherited and is not transitive.

## 16. What is a static member function?

It belongs to the class rather than a particular object.

It has no `this` pointer.

## 17. What is the Rule of 0?

Design classes so resource-managing members handle ownership, allowing the class to avoid manually defining special member functions.

## 18. What is virtual dispatch?

When a virtual member function is called through an appropriate polymorphic base reference/pointer, the runtime selects the overriding implementation.

## 19. What are `override` and `final`?

```cpp
void run() override;
```

ensures a function overrides a base virtual function.

```cpp
class Derived final : public Base {};
```

prevents further inheritance.

## 20. What is dependency inversion in practical C++ design?

High-level code should depend on stable abstractions rather than concrete implementation details.

Interfaces, dependency injection, and composition are common techniques.
