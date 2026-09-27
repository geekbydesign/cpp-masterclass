# `auto`

`auto` was introduced in C++11 to let the compiler deduce a variable's type from its initializer.

## Basic Syntax

```cpp
auto x = 42;        // int
auto d = 3.14;      // double
auto name = "John"; // const char*
```

The variable must have an initializer:

```cpp
auto x; // ERROR
```

## References and Const

```cpp
const int value = 10;

auto a = value;        // int
const auto b = value;  // const int
auto& c = value;       // const int&
const auto& d = value; // const int&
```

`auto` follows template-type-deduction-like rules.

## Pointers

```cpp
int x = 10;

auto p = &x;   // int*
auto* q = &x;  // int*
```

## Why Use `auto`?

Useful when:
- The type is long or complicated.
- The type is obvious from the initializer.
- Working with iterators and templates.
- Avoiding accidental type mismatches.

```cpp
std::vector<int> values{1, 2, 3};

auto it = values.begin();
```

## Common Pitfall

`auto` does not preserve top-level `const` when copying:

```cpp
const int x = 10;
auto y = x; // int
```

Use:

```cpp
const auto y = x;
```

## Interview Point

`auto` is compile-time type deduction. It does not mean dynamic typing.
