# Operator Overloading Basics

Operator overloading allows user-defined types to provide behavior for operators.

```cpp
class Point
{
public:
    int x{};
    int y{};

    Point operator+(const Point& other) const
    {
        return {x + other.x, y + other.y};
    }
};
```

Usage:

```cpp
Point a{1, 2};
Point b{3, 4};

Point c = a + b;
```

The compiler translates the expression conceptually into an operator function call.

## Important Rules

You can overload operators for user-defined types, but you cannot:

- create a new operator
- change an operator's precedence
- change associativity
- change the number of operands
- overload operators only for built-in types

At least one operand must involve a user-defined type for an overloaded operator.

## Operators That Cannot Be Overloaded

Examples:

```text
::    .    .*    ?:    sizeof
```

The exact list should be memorized for interviews.

## Operators That Must Be Members

Some operators must be non-static member functions, including:

```text
operator=
operator[]
operator()
operator->
```

C++20 also has special rules for some comparison/operator forms.

## Design Principle

Operator overloading should make the type behave naturally.

```cpp
a + b
```

should have an intuitive meaning for the type.

## Interview Tip

Operator overloading is **syntactic customization**, not the creation of a new operator.
