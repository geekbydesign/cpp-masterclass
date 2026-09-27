# Function Hiding

A derived declaration with the same name can hide base overloads from unqualified lookup.

```cpp
class Base
{
public:
    void process(int);
    void process(double);
};

class Derived : public Base
{
public:
    void process(std::string);
};
```

The derived `process` declaration can hide the base overload set during lookup.

## Restore Base Overloads

```cpp
class Derived : public Base
{
public:
    using Base::process;
    void process(std::string);
};
```

Now:

```cpp
d.process(10);
d.process(3.14);
d.process("hello");
```

can select the appropriate overload.

## Hiding vs Overriding

Hiding:

```cpp
class Base
{
public:
    void process(int);
};

class Derived : public Base
{
public:
    void process(double);
};
```

Overriding:

```cpp
class Base
{
public:
    virtual void process(int);
};

class Derived : public Base
{
public:
    void process(int) override;
};
```

`override` asks the compiler to verify that a virtual function is actually overridden.

## Interview Tip

```text
same name -> may hide
virtual + compatible signature -> override
```

Do not confuse function hiding with overriding.
