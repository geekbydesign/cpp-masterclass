# `override`

`override` tells the compiler that a derived member function is intended to override a virtual base function.

```cpp
class Base {
public:
    virtual void process(int);
};

class Derived : public Base {
public:
    void process(int) override;
};
```

If the signature does not actually override the base function, compilation fails.

## Common Mistakes Caught

```cpp
class Base {
public:
    virtual void process() const;
};

class Derived : public Base {
public:
    void process() override; // error: missing const
};
```

`override` is especially useful for catching:
- missing `const`
- wrong parameter types
- wrong ref-qualifiers
- accidental function hiding

## Best Practice
Use `override` on derived overrides. It documents intent and lets the compiler verify it.
