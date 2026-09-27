# Friend Classes

A class can grant another class access to its private and protected members.

```cpp
class Engine
{
private:
    int power = 100;

    friend class Car;
};

class Car
{
public:
    void inspect(const Engine& engine)
    {
        std::cout << engine.power;
    }
};
```

`Car` can access `Engine`'s private members.

## Friendship is one-way

If:

```cpp
friend class Car;
```

inside `Engine`, then `Car` can access `Engine`'s private members.

It does not automatically mean:

```text
Engine can access Car's private members
```

## Friendship is not inherited

If `Car` is a friend, a class derived from `Car` does not automatically receive the same friendship privileges.

## Friendship is not transitive

If:

```text
A is friend of B
B is friend of C
```

that does not make A a friend of C.

## Why use friend classes?

Useful when two classes are tightly coupled and one needs controlled access to the other's internals.

Examples may include:

- implementation helpers
- iterators
- tightly coupled manager/resource types
- test helpers in some designs

## Forward declaration

Friend declarations can often use a forward declaration:

```cpp
class Car;

class Engine
{
    friend class Car;
};
```

## Interview point

Friendship grants access; it does not create inheritance, ownership, or a member relationship.
