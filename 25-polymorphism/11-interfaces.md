# Interfaces

C++ has no dedicated `interface` keyword. An interface is usually modeled using an abstract class containing pure virtual functions.

```cpp
class IRenderer {
public:
    virtual ~IRenderer() = default;
    virtual void render() = 0;
};
```

A concrete implementation:

```cpp
class OpenGLRenderer : public IRenderer {
public:
    void render() override {
        // ...
    }
};
```

## Good Interface Characteristics
- Small, focused responsibilities.
- Public pure virtual functions.
- Virtual destructor when used polymorphically.
- Minimal implementation state.

## Interface vs Abstract Class
An interface is a design concept. An abstract class is a C++ language construct.

An abstract class can contain state and implemented functions; an interface-style class usually emphasizes pure virtual operations.
