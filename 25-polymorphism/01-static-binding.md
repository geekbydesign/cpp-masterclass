# Static Binding

## Definition
Static binding (early binding) means the function to call is determined at compile time.

```cpp
class Base {
public:
    void show() { std::cout << "Base"; }
};

class Derived : public Base {
public:
    void show() { std::cout << "Derived"; }
};

Base* p = new Derived;
p->show(); // Base
```

`show()` is non-virtual, so the call is resolved using the **static type** of `p`.

## Key Point
- Non-virtual functions → static binding.
- The compiler uses the expression's static type.
- No runtime dispatch is required.

## Interview Tip
Changing the object type does not create runtime polymorphism unless the relevant function is virtual.
