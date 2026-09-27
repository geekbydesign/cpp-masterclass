# Explicit Conversions

An explicit conversion tells the compiler that a conversion is intentional.

## 1. C++ Casts

The main C++ casts are:

```text
static_cast
const_cast
dynamic_cast
reinterpret_cast
```

They have different purposes.

## 2. `static_cast`

Used for many well-defined compile-time conversions.

```cpp
double value = 3.14;

int result = static_cast<int>(value);
```

The fractional part is discarded.

## 3. Numeric Conversion

```cpp
int x = 10;
double y = static_cast<double>(x);
```

This makes the conversion intent explicit.

## 4. Enum Conversion

```cpp
enum class Color
{
    Red,
    Green,
    Blue
};

Color color = Color::Red;

int value = static_cast<int>(color);
```

`enum class` does not implicitly convert to `int`, so an explicit cast is appropriate.

## 5. `const_cast`

Used to add or remove cv-qualification.

```cpp
const int value = 10;

const int* p = &value;
int* q = const_cast<int*>(p);
```

Removing constness does not make the original object modifiable.

This is dangerous:

```cpp
*q = 20; // undefined behavior if the original object was actually const
```

Use `const_cast` only when you understand the underlying object and API requirements.

## 6. `dynamic_cast`

Used primarily for checked conversions within polymorphic class hierarchies.

```cpp
Base* base = new Derived;

Derived* derived = dynamic_cast<Derived*>(base);
```

If the cast cannot be performed for a pointer, the result is `nullptr`.

For references, failure throws `std::bad_cast`.

Detailed usage is covered in the polymorphism section.

## 7. `reinterpret_cast`

Performs low-level reinterpretation of a value/pointer according to specific rules.

```cpp
std::uintptr_t address =
    reinterpret_cast<std::uintptr_t>(ptr);
```

It should not be used as a general-purpose conversion tool.

It is common in low-level/system programming but requires careful understanding of object representation, alignment, lifetime, and aliasing rules.

## 8. C-Style Casts

```cpp
int value = (int)doubleValue;
```

Avoid C-style casts in modern C++ when a named C++ cast expresses the intent more clearly.

Prefer:

```cpp
int value = static_cast<int>(doubleValue);
```

## 9. `explicit` Constructors

A constructor can prevent unwanted implicit conversions:

```cpp
class Number
{
public:
    explicit Number(int value)
        : value(value)
    {
    }

private:
    int value;
};
```

Now:

```cpp
Number n{10};
```

is valid, while implicit conversion such as:

```cpp
// Number n = 10; // error
```

is prevented.

## 10. Explicit Conversion Operators

Conversion operators can also be marked `explicit`.

```cpp
class Number
{
public:
    explicit operator bool() const
    {
        return value != 0;
    }

private:
    int value{};
};
```

## Quick Revision

```text
static_cast      → ordinary well-defined conversions
const_cast       → cv-qualification
dynamic_cast     → checked polymorphic cast
reinterpret_cast → low-level reinterpretation
```

## Interview Point

Prefer named C++ casts over C-style casts because they make the intended kind of conversion visible and easier to review.
