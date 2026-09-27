# Default Arguments with Virtual Functions

Default arguments are bound **statically**, while virtual function dispatch is dynamic.

```cpp
class Base {
public:
    virtual void show(int x = 10) {
        std::cout << "Base " << x;
    }
};

class Derived : public Base {
public:
    void show(int x = 20) override {
        std::cout << "Derived " << x;
    }
};

Base* p = new Derived;
p->show(); // Derived 10
```

Why?

- The function implementation is selected dynamically → `Derived::show`.
- The default argument is selected from the static type → `Base::show`'s default `10`.

## Best Practice
Avoid changing default arguments across overrides.

Prefer a non-virtual wrapper or another explicit design when default behavior must be consistent.
