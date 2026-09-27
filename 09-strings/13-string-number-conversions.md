# String and Number Conversions

Include:

```cpp
#include <string>
```

## Number to String

```cpp
int value = 42;

std::string text = std::to_string(value);
```

## String to Integer

```cpp
int value = std::stoi("123");
```

Other functions:

```cpp
std::stol()
std::stoll()
std::stoul()
std::stoull()
```

## Floating Point

```cpp
std::stof("3.14");
std::stod("3.14");
std::stold("3.14");
```

## Invalid Input

```cpp
std::stoi("abc");
```

can throw:

```cpp
std::invalid_argument
```

## Out of Range

A result outside the representable range can throw:

```cpp
std::out_of_range
```

## Parsing Position

```cpp
std::size_t pos = 0;

int value = std::stoi("123abc", &pos);
```

Result:

```text
value = 123
pos   = 3
```

## C++17 Alternatives

```cpp
std::from_chars()
std::to_chars()
```

These are low-level, locale-independent conversion APIs and can avoid allocations for suitable use cases.

## Interview Points

- `std::to_string()` converts numbers to strings.
- `stoi`/`stol`/`stod` etc. convert strings to numbers.
- Invalid input can throw `std::invalid_argument`.
- Out-of-range conversion can throw `std::out_of_range`.
- `from_chars`/`to_chars` are important modern alternatives.

**Key idea:** Choose conversion APIs based on simplicity, performance, error handling, and formatting requirements.
