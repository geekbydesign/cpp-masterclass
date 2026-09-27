# Virtual Destructors

If a derived object may be deleted through a base pointer, the base destructor should normally be virtual.

```cpp
class Base {
public:
    virtual ~Base() = default;
};

class Derived : public Base {
public:
    ~Derived() {
        // cleanup
    }
};

Base* p = new Derived;
delete p; // Derived::~Derived(), then Base::~Base()
```

Without a virtual destructor, deleting a derived object through a base pointer results in undefined behavior.

## Rule of Thumb
If a class is intended to be used polymorphically, give it a virtual destructor.

## Smart Pointers
A virtual destructor is still important for a polymorphic base owned through `std::unique_ptr<Base>`.

```cpp
std::unique_ptr<Base> p = std::make_unique<Derived>();
```

## Interview Point
Virtual destructor enables correct destruction through the base interface.
