# Explicit Constructors

## Problem

A single-argument constructor can enable implicit conversions.

```cpp
class Distance
{
public:
    Distance(int meters) {}
};

void print(Distance d) {}

print(10); // implicit conversion: int -> Distance
```

## `explicit`

Use `explicit` to prevent unintended implicit conversions.

```cpp
class Distance
{
public:
    explicit Distance(int meters) {}
};

print(10); // error
print(Distance(10)); // OK
```

## Explicit Conversion

```cpp
Distance d1(10);
Distance d2{10};
Distance d3 = Distance(10);
```

But:

```cpp
Distance d = 10; // not allowed when constructor is explicit
```

## C++11+

`explicit` can also be applied to constructors taking multiple parameters when default arguments or list initialization make the conversion relevant.

## Interview Tip

`explicit` is mainly used to prevent surprising implicit conversions and improve type safety.
