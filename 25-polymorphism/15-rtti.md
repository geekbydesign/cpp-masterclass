# RTTI

RTTI (Run-Time Type Information) provides runtime type information for polymorphic class hierarchies.

The main language features commonly associated with RTTI are:
- `dynamic_cast`
- `typeid`

## Example

```cpp
class Base {
public:
    virtual ~Base() = default;
};

class Derived : public Base {};

Base* p = new Derived;

if (typeid(*p) == typeid(Derived)) {
    // exact dynamic type
}

if (auto* d = dynamic_cast<Derived*>(p)) {
    // safe downcast
}
```

## RTTI and Polymorphism
A class is polymorphic if it has at least one virtual member function.

RTTI is useful for:
- Safe downcasting.
- Inspecting dynamic types.
- Certain framework/plugin designs.

## Design Consideration
Prefer virtual functions and clean interfaces when behavior can be expressed polymorphically. RTTI is a tool, not a replacement for good polymorphic design.
