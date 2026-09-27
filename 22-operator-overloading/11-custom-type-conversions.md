# Custom Type Conversions

C++ allows classes to define conversions between user-defined and other types.

## Converting Constructor

A constructor can convert another type into the class type.

```cpp
class Distance
{
public:
    Distance(double meters)
        : meters(meters)
    {
    }

private:
    double meters;
};
```

This can allow:

```cpp
Distance d = 10.0;
```

unless the constructor is `explicit`.

## `explicit`

Prefer:

```cpp
explicit Distance(double meters);
```

when implicit conversion is not desirable.

## Conversion Operator

A class can define conversion to another type:

```cpp
class Distance
{
public:
    explicit operator double() const
    {
        return meters;
    }

private:
    double meters{};
};
```

Usage:

```cpp
Distance d;

double x = static_cast<double>(d);
```

## Implicit Conversion Operators

Without `explicit`:

```cpp
operator double() const;
```

implicit conversions can occur.

This can make APIs surprising, so explicit conversion is often safer.

## `explicit` Conversion Operators

C++11 allows:

```cpp
explicit operator bool() const;
```

This is especially useful for types that should work in conditions without participating freely in arithmetic conversions.

## Interview Tip

There are two main directions:

```text
other type -> class
    converting constructor

class -> other type
    conversion operator
```
