# `consteval`

`consteval` defines an immediate function.

An immediate function must be evaluated at compile time when called in a context where the call is potentially evaluated.

## 1. Basic Example

```cpp
consteval int square(int x)
{
    return x * x;
}
```

This is valid:

```cpp
constexpr int value = square(5);
```

But:

```cpp
int x = 5;
int value = square(x);
```

is invalid because `x` is not a constant expression suitable for the immediate invocation.

## 2. `constexpr` vs `consteval`

### `constexpr`

```cpp
constexpr int square(int x)
{
    return x * x;
}
```

Can be used:

```cpp
constexpr int a = square(5);
int x = 5;
int b = square(x);
```

### `consteval`

```cpp
consteval int square(int x)
{
    return x * x;
}
```

The call must satisfy immediate invocation requirements.

```cpp
constexpr int a = square(5); // okay
```

Runtime-only use is not allowed.

## 3. Why Use `consteval`?

Use it when a result must be produced at compile time.

Examples include:

- compile-time validation
- compile-time configuration
- generating constants
- enforcing compile-time computation

## 4. Immediate Functions

```cpp
consteval int getVersion()
{
    return 23;
}
```

Every appropriate invocation is evaluated during translation.

## 5. `consteval` Is C++20

`consteval` was introduced in C++20.

```text
C++11 → constexpr introduced
C++20 → consteval introduced
```

## 6. `constexpr` vs `consteval` vs `constinit`

| Keyword | Main purpose |
|---|---|
| `const` | object cannot be modified |
| `constexpr` | constant evaluation possible |
| `consteval` | function call must be immediate/compile-time |
| `constinit` | static/thread-local variable must have static initialization |

## Quick Revision

```cpp
constexpr int f(int x);
```

Can run at compile time or runtime.

```cpp
consteval int f(int x);
```

Must be evaluated at compile time for valid immediate invocations.

## Interview Point

`consteval` is stronger than `constexpr`: it requires compile-time evaluation for immediate invocations instead of merely permitting it.
