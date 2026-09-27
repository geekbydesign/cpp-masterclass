# Relational Operators

Relational operators compare values.

## 1. Operators

```text
<     less than
>     greater than
<=    less than or equal
>=    greater than or equal
```

Example:

```cpp
int a = 10;
int b = 20;

bool result = a < b; // true
```

## 2. Equality Operators

Equality is commonly discussed alongside relational comparisons:

```text
==    equal
!=    not equal
```

```cpp
if (age == 18)
{
    // ...
}
```

## 3. Result Type

A comparison produces a boolean result.

```cpp
bool result = (10 > 5);
```

`result` is `true`.

## 4. Chained Comparisons

Do not write mathematical-style chains expecting them to work as mathematics.

This:

```cpp
a < b < c
```

is not interpreted as:

```cpp
(a < b) && (b < c)
```

Instead, it is grouped according to C++ operator rules, and the first comparison produces a `bool` that then participates in the second comparison.

Write:

```cpp
(a < b) && (b < c)
```

when that is the intended meaning.

## 5. Floating-Point Comparison

Direct equality comparison can be problematic for floating-point calculations.

```cpp
double a = 0.1 + 0.2;
double b = 0.3;

if (a == b)
{
    // may not be true
}
```

For numerical algorithms, an appropriate tolerance may be required.

## 6. Signed and Unsigned Comparisons

Be careful when comparing signed and unsigned integers.

```cpp
int a = -1;
unsigned int b = 1;

if (a < b)
{
    // conversion rules can produce surprising results
}
```

The signed value may be converted to unsigned depending on the operand types.

## 7. Comparison in Conditions

```cpp
if (score >= 50)
{
    std::cout << "Pass";
}
```

## Quick Revision

```text
<   >   <=   >=
==  !=
```

Comparison result:

```cpp
bool
```

## Interview Points

- `==` checks equality; `=` performs assignment.
- Relational expressions produce boolean results.
- Avoid chained comparisons such as `a < b < c`.
- Be careful with signed/unsigned comparisons.
- Floating-point equality requires numerical awareness.
