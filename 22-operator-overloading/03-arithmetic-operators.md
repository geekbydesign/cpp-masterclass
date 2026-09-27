# Arithmetic Operators

Arithmetic operators commonly overloaded for user-defined numeric-like types include:

```text
+  -  *  /  %
```

Example:

```cpp
class Complex
{
public:
    double real{};
    double imag{};

    Complex operator+(const Complex& other) const
    {
        return {
            real + other.real,
            imag + other.imag
        };
    }
};
```

Usage:

```cpp
Complex a{1, 2};
Complex b{3, 4};

Complex c = a + b;
```

## Non-Mutating Operators

Typically return a new value:

```cpp
Complex operator+(const Complex& other) const;
```

The `const` means the left operand is not modified.

## Compound Operators

A common implementation pattern is:

```cpp
Complex& operator+=(const Complex& other)
{
    real += other.real;
    imag += other.imag;
    return *this;
}
```

Then:

```cpp
Complex operator+(Complex lhs, const Complex& rhs)
{
    lhs += rhs;
    return lhs;
}
```

This can reduce duplicated logic.

## Unary Minus

```cpp
Complex operator-() const
{
    return {-real, -imag};
}
```

## Design Principle

Arithmetic operators should preserve intuitive mathematical semantics where appropriate.

## Interview Tip

For value-like types:

```text
+= modifies and returns *this
+ usually returns a new value
```
