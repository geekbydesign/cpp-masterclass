# `struct` vs `class`

In C++, `struct` and `class` are almost identical language constructs.

The main default differences are:

| Feature | `struct` | `class` |
|---|---|---|
| Default member access | `public` | `private` |
| Default base-class access | `public` | `private` |

## Example

```cpp
struct Point
{
    int x;
    int y;
};
```

Members are public by default.

```cpp
class Point
{
    int x;
    int y;
};
```

Members are private by default.

## Both can have

- constructors
- destructors
- member functions
- private/protected/public members
- inheritance
- virtual functions
- templates
- static members
- nested types

## Common convention

Use `struct` when the type primarily represents public data with simple semantics.

Use `class` when encapsulation and invariants are central.

This is a convention, not a language restriction.

## Explicit access

```cpp
struct Data
{
private:
    int value;
};
```

A struct can still have private members.

```cpp
class Data
{
public:
    int value;
};
```

A class can still have public members.

## Interview point

The key technical difference is **default access**, not capability.
