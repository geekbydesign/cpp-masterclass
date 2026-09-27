# Member vs Non-Member Operators

An overloaded operator can often be implemented as a member or non-member function.

## Member Operator

```cpp
class Point
{
public:
    Point operator+(const Point& other) const;
};
```

Usage:

```cpp
a + b;
```

Conceptually:

```cpp
a.operator+(b);
```

The left operand is the implicit `*this`.

## Non-Member Operator

```cpp
Point operator+(const Point& lhs, const Point& rhs)
{
    return {lhs.x + rhs.x, lhs.y + rhs.y};
}
```

Usage remains:

```cpp
a + b;
```

Conceptually:

```cpp
operator+(a, b);
```

## Why Non-Member?

Non-member operators are useful when:

- both operands should be treated symmetrically
- implicit conversion of the left operand is desirable
- the operator naturally works on two independent operands

Example:

```cpp
class Number
{
public:
    Number(int value);
};

Number operator+(const Number&, const Number&);
```

A non-member can allow conversions on both operands.

## Friend

A non-member operator can be declared `friend` when it needs private access:

```cpp
class Point
{
    int x{};

    friend Point operator+(const Point&, const Point&);
};
```

## General Guideline

Use a member when the operation naturally modifies/queries the left object or must be a member.

Use a non-member when symmetry and implicit conversions make the interface clearer.

## Interview Tip

Do not memorize "all binary operators should be non-member." The correct choice depends on the operator and desired semantics.
