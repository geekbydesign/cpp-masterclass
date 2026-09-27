# Unary Operators

Unary operators operate on one operand.

Common overloadable unary operators include:

```text
+   -   !   ~
++  --
*   &
```

Example:

```cpp
class Number
{
public:
    Number operator-() const
    {
        return Number(-value);
    }

private:
    int value{};
};
```

Usage:

```cpp
Number result = -number;
```

## Logical NOT

```cpp
bool operator!() const
{
    return value == 0;
}
```

## Bitwise NOT

```cpp
Number operator~() const;
```

## Dereference

Pointer-like classes can overload:

```cpp
T& operator*();
```

## Address-Of

`operator&` can be overloaded, but doing so can be surprising and should be justified carefully.

## Unary Operators and `const`

If a unary operation does not modify the object:

```cpp
T operator-() const;
```

is appropriate.

## Interview Tip

Unary operators have one operand; prefix/postfix `++` and `--` are special because they modify the object and have distinct overload forms.
