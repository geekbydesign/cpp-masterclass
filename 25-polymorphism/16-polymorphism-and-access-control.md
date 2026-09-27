# Polymorphism and Access Control

Access control and virtual dispatch are separate concepts.

```cpp
class Base {
public:
    virtual void run() {
        std::cout << "Base";
    }
};

class Derived : public Base {
private:
    void run() override {
        std::cout << "Derived";
    }
};

Base* p = new Derived;
p->run(); // Derived
```

The call is made through the public base interface. Once the call is valid, virtual dispatch selects the derived override.

## Important
A derived override can have different access control from the base declaration.

```cpp
class Base {
public:
    virtual void process();
};

class Derived : public Base {
private:
    void process() override;
};
```

Calling through `Derived` directly is subject to `Derived`'s private access:

```cpp
Derived d;
// d.process(); // error
```

Calling through `Base` can still use the public base interface:

```cpp
Base& b = d;
b.process(); // virtual dispatch to Derived::process()
```

## Key Point
- **Access control** determines whether the call expression is allowed.
- **Virtual dispatch** determines which override executes.
- They solve different problems.
