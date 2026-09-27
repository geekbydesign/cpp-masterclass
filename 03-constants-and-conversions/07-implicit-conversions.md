# Implicit Conversions

An implicit conversion happens when C++ automatically converts a value from one type to another.

## 1. Basic Example

```cpp
int x = 10;
double y = x;
```

The `int` is implicitly converted to `double`.

## 2. Numeric Promotions

Smaller integral types can be promoted during expressions.

```cpp
char c = 'A';

int value = c;
```

The character can be promoted to `int`.

## 3. Usual Arithmetic Conversions

When different arithmetic types participate in an operation, C++ applies conversion rules to determine a common type.

```cpp
int a = 10;
double b = 2.5;

auto result = a + b;
```

The result is a floating-point type.

## 4. Narrowing Conversions

Some implicit conversions can lose information.

```cpp
double value = 3.14;
int x = value;
```

The fractional portion is lost.

## 5. List Initialization Rejects Narrowing

```cpp
int x = 3.14; // allowed, but conversion loses information
```

With braces:

```cpp
int x{3.14}; // error: narrowing conversion
```

This is one reason list initialization is useful.

## 6. Signed and Unsigned

Mixing signed and unsigned values can produce surprising results.

```cpp
int a = -1;
unsigned int b = 1;

if (a < b)
{
    // may not behave as expected
}
```

The usual arithmetic conversions can convert the signed value to unsigned.

## 7. Boolean Conversion

Many values can be contextually converted to `bool`.

```cpp
int value = 10;

if (value)
{
    // true
}
```

Zero converts to false; non-zero values generally convert to true.

Pointers also have contextual conversion to `bool`:

```cpp
int* ptr = nullptr;

if (ptr)
{
    // ptr is non-null
}
```

## 8. Pointer Conversions

A derived-class pointer can implicitly convert to a suitable base-class pointer.

```cpp
class Base {};
class Derived : public Base {};

Derived d;
Base* ptr = &d;
```

This is an important part of polymorphism.

## 9. User-Defined Conversions

Classes can define conversion constructors or conversion operators.

Example:

```cpp
class Number
{
public:
    Number(int value)
        : value(value)
    {
    }

private:
    int value;
};
```

The converting constructor can participate in implicit conversion unless marked `explicit`.

## 10. Avoid Surprising Conversions

Prefer explicit types or casts when conversion intent matters.

```cpp
double value = 10.5;
int count = static_cast<int>(value);
```

## Interview Points

- Implicit conversions happen automatically.
- Numeric promotions are common during expressions.
- Signed/unsigned conversions can cause bugs.
- Brace initialization rejects narrowing conversions.
- `explicit` can prevent unwanted user-defined implicit conversions.
