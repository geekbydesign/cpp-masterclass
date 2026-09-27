# Overflow and Underflow

Overflow and underflow occur when a calculation cannot be represented as intended by the target type.

## 1. Signed Integer Overflow

Signed integer overflow is **undefined behavior**.

```cpp
int x = std::numeric_limits<int>::max();

// x += 1; // undefined behavior
```

Do not rely on wraparound for signed integers.

## 2. Unsigned Integer Overflow

Unsigned arithmetic is defined modulo `2^N`, where `N` is the number of value bits.

Example:

```cpp
unsigned int x = 0;

--x;
```

The result wraps to the maximum value representable by that unsigned type.

Unsigned wraparound is defined, but it can still produce application bugs if not intended.

## 3. Floating-Point Overflow

Floating-point types have finite ranges.

A calculation beyond the representable range can produce implementation-defined/IEC 60559-related special values depending on the implementation, commonly infinity for IEEE-style floating point.

Example:

```cpp
double x = std::numeric_limits<double>::max();
double y = x * 2.0;
```

The result may become positive infinity on typical IEEE-754 implementations.

## 4. Floating-Point Underflow

Very small floating-point values may lose precision or become subnormal/zero depending on the calculation and implementation.

```cpp
double x = 1e-300;
double y = x * 1e-300;
```

The result may underflow toward zero.

## 5. Integer Division

Integer division does not produce a fractional result.

```cpp
int x = 5 / 2;
```

Result:

```text
2
```

This is not called floating-point underflow; it is integer division.

## 6. Narrowing Conversion

A value can also be lost during conversion:

```cpp
double value = 1e20;
int x = static_cast<int>(value);
```

Do not assume every numeric conversion produces a meaningful result.

## 7. Preventing Overflow

Check before performing an operation when required.

For example:

```cpp
if (a > std::numeric_limits<int>::max() - b)
{
    // addition would overflow
}
else
{
    int result = a + b;
}
```

For production code, choose a suitable integer type and define overflow behavior explicitly.

## 8. `std::numeric_limits`

Use:

```cpp
#include <limits>
```

Example:

```cpp
std::numeric_limits<int>::max();
std::numeric_limits<int>::lowest();
```

For floating-point types:

```cpp
std::numeric_limits<double>::max();
std::numeric_limits<double>::lowest();
std::numeric_limits<double>::epsilon();
```

## 9. Important Distinction

```text
Signed integer overflow
    → undefined behavior

Unsigned integer overflow
    → modulo arithmetic

Floating-point overflow
    → depends on representation/implementation;
       IEEE-style systems commonly produce infinity

Floating-point underflow
    → loss of magnitude/precision, potentially subnormal or zero
```

## Interview Points

- Never assume signed integer overflow wraps.
- Unsigned arithmetic wraps modulo the type's range.
- Floating-point overflow/underflow differs from integer overflow.
- Validate arithmetic when inputs can approach type limits.
