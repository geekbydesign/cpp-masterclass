# Integral Conditions

C++ allows integral values to be used where a boolean condition is expected.

## Basic Rule

```text
0        → false
non-zero → true
```

Example:

```cpp
int value = 10;

if (value)
{
    std::cout << "true";
}
```

## Zero

```cpp
int value = 0;

if (value)
{
    // not executed
}
```

## Negative Values

Negative values are non-zero:

```cpp
int value = -5;

if (value)
{
    // executed
}
```

## Explicit Comparison

Both are valid:

```cpp
if (count)
{
}
```

```cpp
if (count != 0)
{
}
```

Use the form that communicates intent most clearly.

## Boolean Conversion

```cpp
int value = 42;

bool result = static_cast<bool>(value);
```

`result` is `true`.

## Pointers

Pointers also have contextual conversion to `bool`:

```cpp
int* ptr = nullptr;

if (ptr)
{
    // non-null
}
```

An explicit form is:

```cpp
if (ptr != nullptr)
{
}
```

## Floating-Point Values

Floating-point values can also be used as conditions:

```cpp
double value = 0.5;

if (value)
{
    // true
}
```

This is a boolean conversion, not a reliable substitute for numerical equality testing.

## Common Pitfall

```cpp
if (count = 10)
{
}
```

assigns `10`.

For comparison:

```cpp
if (count == 10)
{
}
```

## Quick Revision

```text
0      → false
!= 0   → true
```

A condition can use a value that is contextually convertible to `bool`; it does not have to literally have type `bool`.
