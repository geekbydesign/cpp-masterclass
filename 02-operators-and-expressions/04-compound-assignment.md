# Compound Assignment

Compound assignment combines an operation with assignment.

## 1. Operators

```text
+=
-=
*=
/=
%=
<<=
>>=
&=
|=
^=
```

## 2. Basic Example

```cpp
int x = 10;

x += 5;
```

Equivalent in simple cases to:

```cpp
x = x + 5;
```

Then:

```text
x == 15
```

Other examples:

```cpp
x -= 2;
x *= 3;
x /= 2;
x %= 4;
```

## 3. Bitwise Compound Assignment

```cpp
unsigned int flags = 0;

flags |= 0x01;
flags &= 0x0F;
flags ^= 0x02;
flags <<= 1;
flags >>= 1;
```

These are covered in more detail in the bitwise operators section.

## 4. Why Use Compound Assignment?

It is concise:

```cpp
total += value;
```

instead of:

```cpp
total = total + value;
```

It also clearly expresses the intention of modifying the existing object.

## 5. Type Considerations

Conversions can occur during compound assignment.

```cpp
int x = 10;
x += 2.5;
```

The right-hand side participates in the arithmetic and the resulting value is converted back to the type of `x`.

Be aware of possible narrowing or loss of information.

## 6. Example

```cpp
int total = 0;

for (int i = 1; i <= 5; ++i)
{
    total += i;
}
```

Result:

```text
15
```

## Quick Revision

```text
x += y  → x = x + y
x -= y  → x = x - y
x *= y  → x = x * y
x /= y  → x = x / y
x %= y  → x = x % y
```

The compound assignment operators for bitwise/shift operations are:

```text
<<=  >>=  &=  |=  ^=
```
