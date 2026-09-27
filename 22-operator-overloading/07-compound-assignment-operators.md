# Compound Assignment Operators

Compound assignment operators include:

```text
+=  -=  *=  /=  %=

&=  |=  ^=  <<=  >>=
```

Example:

```cpp
class Number
{
public:
    Number& operator+=(const Number& other)
    {
        value += other.value;
        return *this;
    }

private:
    int value{};
};
```

## Return `*this`

Conventionally:

```cpp
return *this;
```

allows:

```cpp
a += b += c;
```

## Implementing `+` Using `+=`

A common pattern:

```cpp
Number operator+(Number lhs, const Number& rhs)
{
    lhs += rhs;
    return lhs;
}
```

This reuses the mutation logic.

## Why Return by Reference?

The compound operator modifies the existing object.

```cpp
a += b
```

therefore commonly returns:

```cpp
Number&
```

## Const

Compound assignment cannot normally be `const` because it modifies the object.

```cpp
Number& operator+=(const Number& other);
```

not:

```cpp
Number& operator+=(const Number& other) const;
```

## Interview Tip

Common relationship:

```text
a += b -> modifies a
a + b  -> produces a result
```
