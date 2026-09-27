# `std::numeric_limits`

`std::numeric_limits` provides information about arithmetic types.

Include:

```cpp
#include <limits>
```

## 1. Maximum Value

```cpp
std::numeric_limits<int>::max()
```

Example:

```cpp
std::cout << std::numeric_limits<int>::max();
```

## 2. Minimum Value

For an integer type:

```cpp
std::numeric_limits<int>::min()
```

For signed integers, this is the most negative representable value.

For unsigned integers:

```cpp
std::numeric_limits<unsigned int>::min()
```

is:

```text
0
```

## 3. `lowest()`

`lowest()` gives the lowest finite value for the type.

```cpp
std::numeric_limits<double>::lowest()
```

For signed integer types, `lowest()` corresponds to the most negative value.

A useful distinction is:

```cpp
std::numeric_limits<int>::min()
```

is the smallest integer value.

For floating-point types, `min()` does **not** mean the most negative number.

## 4. Floating-Point `min()`

For floating-point types:

```cpp
std::numeric_limits<double>::min()
```

is the smallest positive **normal** value, not the most negative value.

Use:

```cpp
std::numeric_limits<double>::lowest()
```

when you need the lowest finite value.

This is a common interview trap.

## 5. `epsilon()`

For floating-point types:

```cpp
std::numeric_limits<double>::epsilon()
```

represents the difference between `1` and the next representable value greater than `1` for the type.

It is related to floating-point precision but is not a universal tolerance for comparing arbitrary floating-point numbers.

## 6. Digits

```cpp
std::numeric_limits<int>::digits
```

gives the number of radix/base-2 digits in the type's representation used for the value, excluding any sign bit for signed integer types.

For floating-point types, related members describe precision.

## 7. `is_signed`

```cpp
std::numeric_limits<int>::is_signed
```

Example:

```cpp
if (std::numeric_limits<int>::is_signed)
{
    // signed type
}
```

## 8. `is_integer`

```cpp
std::numeric_limits<int>::is_integer
```

Can be used to query whether a type is an integer type.

## 9. `is_iec559`

For implementations following IEC 60559 floating-point characteristics:

```cpp
std::numeric_limits<double>::is_iec559
```

can provide relevant information.

Do not use this as a blanket assumption that every detail of IEEE-754 behavior is guaranteed by merely having a `double`.

## 10. Example

```cpp
#include <iostream>
#include <limits>

int main()
{
    std::cout << "int max: "
              << std::numeric_limits<int>::max() << '\n';

    std::cout << "int min: "
              << std::numeric_limits<int>::min() << '\n';

    std::cout << "double max: "
              << std::numeric_limits<double>::max() << '\n';

    std::cout << "double lowest: "
              << std::numeric_limits<double>::lowest() << '\n';

    std::cout << "double min: "
              << std::numeric_limits<double>::min() << '\n';

    std::cout << "double epsilon: "
              << std::numeric_limits<double>::epsilon() << '\n';
}
```

## 11. Commonly Useful Members

```text
max()
min()
lowest()
epsilon()
digits
digits10
max_digits10
is_signed
is_integer
is_iec559
has_infinity
has_quiet_NaN
```

## Interview Trap

### What is the difference?

```cpp
std::numeric_limits<double>::min()
```

→ smallest positive normal `double`.

```cpp
std::numeric_limits<double>::lowest()
```

→ most negative finite `double`.

This is one of the most frequently misunderstood `numeric_limits` details.

## Quick Revision

```text
max()       → largest finite/value limit
min()       → smallest positive normal for floating-point
lowest()    → lowest finite value
epsilon()   → precision step around 1
is_signed   → signedness
is_integer  → integer-type property
```
