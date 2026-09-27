# Inheritance and Destructors

When a derived object is destroyed, the derived destructor runs before the base destructor.

```cpp
class Base
{
public:
    ~Base() {}
};

class Derived : public Base
{
public:
    ~Derived() {}
};
```

Destruction:

```text
Derived destructor
      ↓
Base destructor
```

## Polymorphic Deletion

If an object may be deleted through a base pointer, the base destructor should be virtual:

```cpp
class Base
{
public:
    virtual ~Base() = default;
};
```

Then:

```cpp
Base* p = new Derived;
delete p;
```

correctly destroys the derived object and then the base subobject.

## Without a Virtual Destructor

Deleting a derived object through a base pointer when the base destructor is non-virtual does not provide the required polymorphic destruction behavior and leads to undefined behavior.

## Smart Pointers

```cpp
std::unique_ptr<Base> p =
    std::make_unique<Derived>();
```

For polymorphic ownership, the base class should have an appropriate virtual destructor.

## Interview Tip

A polymorphic base class should generally have a virtual destructor when destruction can occur through a base-class interface.
