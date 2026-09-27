# Object Slicing

Object slicing occurs when a derived object is copied into a base object **by value**.

```cpp
class Base {
public:
    virtual void show() { std::cout << "Base"; }
};

class Derived : public Base {
public:
    void show() override { std::cout << "Derived"; }
};

Derived d;
Base b = d; // slicing
b.show();   // Base
```

The derived-specific part is removed from `b`.

## Avoiding Slicing

Use a reference or pointer:

```cpp
Base& ref = d;
Base* ptr = &d;

ref.show();   // Derived
ptr->show();  // Derived
```

## Interview Point
Virtual functions do not prevent slicing. Slicing happens before the virtual call because the destination is a separate base object.
