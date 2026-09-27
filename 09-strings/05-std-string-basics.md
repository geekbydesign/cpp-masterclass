# `std::string` Basics

Include:

```cpp
#include <string>
```

## Creation

```cpp
std::string name = "Sachin";
std::string empty;
```

Other forms:

```cpp
std::string a("Hello");
std::string b{'H', 'i'};
```

## Copy

```cpp
std::string first = "Hello";
std::string second = first;
```

## Access

```cpp
text[0];       // unchecked
text.at(0);    // bounds checked
```

## Input

One word:

```cpp
std::cin >> text;
```

Whole line:

```cpp
std::getline(std::cin, text);
```

## Empty Check

```cpp
if (text.empty())
{
}
```

## Comparison

```cpp
if (a == b)
{
}
```

## Interview Points

- `std::string` manages its own character storage.
- It has dynamic size.
- `operator[]` does not perform bounds checking.
- `at()` performs bounds checking.
- `getline()` reads spaces; `operator>>` stops at whitespace.

**Key idea:** Prefer `std::string` over raw C-strings for normal C++ string handling.
