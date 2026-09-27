# Friend Functions

A friend function is not a member of the class but is allowed to access its private and protected members.

```cpp
class Box
{
private:
    int value = 10;

public:
    friend void print(const Box& box);
};

void print(const Box& box)
{
    std::cout << box.value;
}
```

## Important property

`print()` is a free function, not a member function.

It simply has special access permission.

## Why use friends?

Common uses include:

- stream operators
- symmetric binary operators
- tightly coupled helper functions
- functions that need access to private representation

Example:

```cpp
class Point
{
private:
    int x;
    int y;

public:
    friend Point operator+(const Point& a, const Point& b);
};
```

## Friendship is not inheritance

A friend function does not become a member and does not receive a `this` pointer.

## Friendship is not automatically mutual

If `A` is a friend of `B`, that does not automatically make `B` a friend of `A`.

## Friendship is not inherited

Derived classes do not automatically inherit friendship relationships.

## Interview point

Friendship breaks normal access restrictions deliberately, so it should be used when it improves the class interface/design rather than as a general way around encapsulation.
