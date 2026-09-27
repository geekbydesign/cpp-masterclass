# Pure Virtual Functions

A pure virtual function is declared with `= 0`.

```cpp
class Shape {
public:
    virtual void draw() = 0;
};
```

It specifies an interface requirement for derived classes.

## Derived Implementation

```cpp
class Circle : public Shape {
public:
    void draw() override {
        std::cout << "Circle";
    }
};
```

## Important
A pure virtual function makes the class abstract when the class is otherwise subject to the abstract-class rules.

A pure virtual function can have a definition:

```cpp
class Base {
public:
    virtual void process() = 0;
};

void Base::process() {
    // shared implementation
}
```

A derived class can call that implementation explicitly:

```cpp
Base::process();
```

## Key Point
`= 0` means the function is pure virtual; it does not necessarily mean the function has no implementation.
