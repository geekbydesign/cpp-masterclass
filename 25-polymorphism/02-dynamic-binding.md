# Dynamic Binding

## Definition
Dynamic binding (late binding) means the function to call is selected at runtime based on the object's dynamic type.

```cpp
class Base {
public:
    virtual void show() { std::cout << "Base"; }
};

class Derived : public Base {
public:
    void show() override { std::cout << "Derived"; }
};

Base* p = new Derived;
p->show(); // Derived
```

## Requirements
Runtime dispatch generally requires:
1. A base-class virtual function.
2. A derived override.
3. Access through a base pointer/reference.

## Static vs Dynamic Binding

| Binding | Decision | Typical mechanism |
|---|---|---|
| Static | Compile time | Non-virtual function |
| Dynamic | Runtime | Virtual function |

## Important
A virtual call requires an appropriate polymorphic base relationship. A call through a value object is not magically dynamic.
