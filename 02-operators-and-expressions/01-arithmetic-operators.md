# Arithmetic Operators

Arithmetic operators perform numerical calculations.

## 1. Basic Operators

| Operator | Meaning | Example |
|---|---|---|
| `+` | Addition | `a + b` |
| `-` | Subtraction | `a - b` |
| `*` | Multiplication | `a * b` |
| `/` | Division | `a / b` |
| `%` | Remainder | `a % b` |

## 2. Addition

```cpp
int a = 10;
int b = 3;

int result = a + b; // 13
```

The `+` operator can also be used with strings:

```cpp
std::string first = "Hello ";
std::string second = "World";

std::string result = first + second;
```

## 3. Subtraction

```cpp
int result = 10 - 3; // 7
```

## 4. Multiplication

```cpp
int result = 10 * 3; // 30
```

## 5. Division

For integers, division produces an integer result.

```cpp
int result = 10 / 3; // 3
```

The fractional part is discarded.

For floating-point division:

```cpp
double result = 10.0 / 3.0;
```

## 6. Division by Zero

Integer division by zero is undefined behavior.

```cpp
int x = 10;
// int y = x / 0; // invalid operation
```

Do not perform division unless the divisor is known to be non-zero.

## 7. Remainder `%`

The `%` operator gives the remainder of integer division.

```cpp
int remainder = 10 % 3; // 1
```

Useful for:

```cpp
if (number % 2 == 0)
{
    // even
}
```

## 8. Unary `+` and `-`

```cpp
int value = 10;

int a = +value; // 10
int b = -value; // -10
```

## 9. Type Conversions

Arithmetic involving different types may cause implicit conversions.

```cpp
int a = 10;
double b = 3.0;

double result = a + b;
```

The integer is converted so the operation can be performed using a common type.

## 10. Overflow

Signed integer overflow is undefined behavior.

```cpp
int x = std::numeric_limits<int>::max();
// x + 1; // undefined behavior
```

Unsigned arithmetic wraps modulo `2^N` for the corresponding width.

## Quick Revision

```text
+  → addition
-  → subtraction
*  → multiplication
/  → division
%  → remainder
```

Important:

```cpp
10 / 3   // 3
10.0 / 3 // approximately 3.333...
```

## Interview Points

- Integer division truncates toward zero.
- `%` is primarily used with integral operands.
- Signed overflow is undefined behavior.
- Arithmetic can trigger implicit type conversions.
