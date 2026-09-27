# One Definition Rule (ODR)

The One Definition Rule places restrictions on how entities can be defined across a C++ program.

A simple rule:

> A definable item generally must not have more than one definition in a program.

## Bad Example

Header:

```cpp
// bad.h
int value = 10;
```

If included by multiple `.cpp` files, each translation unit can get a definition of `value`, causing a multiple-definition linker error.

## Correct Pattern

Header:

```cpp
extern int value;
```

Source:

```cpp
int value = 10;
```

## Inline Exception

An inline function can be defined in multiple translation units as long as the definitions satisfy the ODR requirements.

```cpp
inline int add(int a, int b)
{
    return a + b;
}
```

Similarly, C++17 inline variables can have one definition across the program while being defined in multiple translation units through a header.

## ODR Also Matters For

- functions
- variables
- classes
- templates
- inline entities

## ODR-Use

Some expressions require an object/function to have a definition available; this is commonly discussed as **ODR-use**.

The exact rules are nuanced.

## Interview Tip

Remember:

```text
One program
    ↓
one definition for most definable entities
    ↓
special rules for inline/templates/etc.
```

The ODR is broader than simply "the linker complains about duplicates."
