# `dynamic_cast`

`dynamic_cast` performs runtime-checked conversions within polymorphic class hierarchies.

```cpp
class Base {
public:
    virtual ~Base() = default;
};

class Derived : public Base {
public:
    void process() {}
};

Base* p = new Derived;

if (Derived* d = dynamic_cast<Derived*>(p)) {
    d->process();
}
```

If the pointer cast fails, the result is `nullptr`.

## Reference Cast

```cpp
try {
    Derived& d = dynamic_cast<Derived&>(baseRef);
}
catch (const std::bad_cast&) {
}
```

## Requirements
For runtime downcasting, the source type generally needs to be polymorphic (for example, it has a virtual function).

## Use Carefully
Frequent downcasting can indicate that the interface is missing a virtual operation needed by the design.
