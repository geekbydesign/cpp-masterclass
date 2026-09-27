# Using Base Members

A derived class can bring a base member into its scope with a `using` declaration.

```cpp
class Base
{
protected:
    void process();
};

class Derived : public Base
{
public:
    using Base::process;
};
```

## Restoring Overloads

A common use is preventing accidental hiding:

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
    using Base::process;
    void process(std::string);
};
```

Now all three overloads can participate in lookup.

## Changing Access

A `using` declaration can expose an inherited member under a different access section when permitted:

```cpp
class Derived : private Base
{
public:
    using Base::process;
};
```

## Important

`using Base::member;` does not copy the member. It introduces the base member into the derived class's lookup set.

## Interview Tip

Main uses:

```text
restore hidden overloads
adjust accessibility of inherited members
```
