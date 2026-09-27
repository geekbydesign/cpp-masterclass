# Inline Variables and Static Data Members

C++17 introduced **inline variables**, solving a common multiple-definition problem for variables defined in headers.

## Traditional Static Data Member

Before C++17, a static data member generally needed a separate out-of-class definition:

```cpp
class Config
{
public:
    static int value;
};

int Config::value = 42;
```

If the definition is placed in a header incorrectly, it can cause multiple-definition linker errors.

## C++17 Inline Static Member

```cpp
class Config
{
public:
    inline static int value = 42;
};
```

The definition can be included in multiple translation units.

## Why `inline`?

For variables, `inline` is primarily an ODR/linkage feature.

It does not mean:

> "The compiler must put this variable somewhere special."

It allows multiple identical definitions across translation units under the inline-variable rules.

## `constexpr` Static Members

C++17 also simplified `constexpr` static data members:

```cpp
class Config
{
public:
    static constexpr int value = 42;
};
```

The C++17 rules removed the need for the old separate definition in the common case.

## Inline Namespace-Scope Variable

```cpp
inline int globalValue = 42;
```

Such a variable can be defined in a header and included by multiple translation units, subject to the ODR rules.

## Interview Point

```text
inline function
→ multiple identical definitions allowed across translation units

inline variable
→ same ODR principle applied to variables
```

The important concept is **ODR-safe definition across translation units**, not forced inlining.
