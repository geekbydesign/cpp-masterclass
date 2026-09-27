# `constinit`

`constinit` is used with variables having static or thread storage duration to require static initialization.

It was introduced in C++20.

## 1. Basic Example

```cpp
constinit int value = 42;
```

The declaration requires the variable to be initialized during static initialization rather than dynamic initialization.

## 2. Important Distinction

`constinit` does **not** mean the variable is const.

```cpp
constinit int value = 42;

value = 100; // allowed
```

The variable can still be modified.

Compare:

```cpp
constexpr int a = 42; // const and compile-time constant
constinit int b = 42; // static initialization required; not necessarily const
```

## 3. Storage Duration Requirement

`constinit` applies to variables with static or thread storage duration.

For example:

```cpp
constinit int globalValue = 10;
```

A local automatic variable cannot simply be declared:

```cpp
// constinit int local = 10; // invalid use
```

## 4. Why `constinit`?

One important use is avoiding unintended dynamic initialization of global/static state.

Without `constinit`, initialization of static-storage objects can sometimes involve dynamic initialization and initialization-order concerns.

With:

```cpp
constinit int value = 10;
```

the compiler verifies that the initialization is static.

## 5. It Does Not Make the Variable Constant

This is the key distinction:

```cpp
constinit int counter = 0;

++counter; // valid
```

Whereas:

```cpp
constexpr int counter = 0;

// ++counter; // error
```

## 6. `constinit` vs `constexpr`

```text
constexpr
    → constant expression
    → object is const
    → compile-time constant use

constinit
    → static/thread storage
    → guarantees static initialization
    → object may remain mutable
```

## 7. Example

```cpp
consteval int getInitialValue()
{
    return 100;
}

constinit int globalValue = getInitialValue();

void update()
{
    globalValue += 10;
}
```

`globalValue` is statically initialized and remains mutable.

## Interview Points

- `constinit` is C++20.
- It applies to static/thread storage duration variables.
- It requires static initialization.
- It does not make an object `const`.
- It helps prevent problems associated with unintended dynamic initialization.
