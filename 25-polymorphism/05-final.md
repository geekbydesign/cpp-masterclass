# `final`

`final` prevents further overriding or inheritance.

## Final Virtual Function

```cpp
class Base {
public:
    virtual void run();
};

class Derived : public Base {
public:
    void run() final;
};

class Child : public Derived {
public:
    void run() override; // error
};
```

## Final Class

```cpp
class Logger final {
};
```

```cpp
class MyLogger : public Logger { // error
};
```

## Summary
- `virtual ... final` → cannot be overridden further.
- `class X final` → cannot be used as a base class.
