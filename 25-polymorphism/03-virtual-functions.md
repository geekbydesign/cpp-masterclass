# Virtual Functions

## Definition
A virtual function enables runtime polymorphism through a base pointer or reference.

```cpp
class Shape {
public:
    virtual void draw() {
        std::cout << "Shape";
    }
};

class Circle : public Shape {
public:
    void draw() override {
        std::cout << "Circle";
    }
};

Circle c;
Shape& s = c;
s.draw(); // Circle
```

## Important Rules
- Declare the base function `virtual`.
- A derived function with the same appropriate signature overrides it.
- `virtual` is inherited; writing it again in the derived class is optional.
- `override` is recommended to make intent explicit.

## Virtual Calls
Dynamic dispatch applies through a base pointer/reference.

```cpp
Shape* p = &c;
p->draw();
```

## Implementation Note
Most implementations use a virtual table (vtable) and a hidden virtual-table pointer (vptr), but these are implementation techniques rather than requirements imposed by the C++ standard.
