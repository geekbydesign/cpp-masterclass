# Character Manipulation

## `char`

```cpp
char ch = 'A';
```

Character literals use single quotes; string literals use double quotes.

```cpp
'A'
"Hello"
```

## Character Classification

```cpp
#include <cctype>

std::isalpha(ch);
std::isdigit(ch);
std::isalnum(ch);
std::isspace(ch);
std::islower(ch);
std::isupper(ch);
```

## Character Conversion

```cpp
std::toupper(ch);
std::tolower(ch);
```

For potentially signed `char`, use the robust pattern:

```cpp
std::toupper(static_cast<unsigned char>(ch));
```

## Character and Digits

```cpp
char digit = '7';
int value = digit - '0';
```

For a single decimal digit:

```cpp
char digit = static_cast<char>('0' + value);
```

## Interview Points

- `'A'` is a character literal; `"A"` is a string literal.
- `<cctype>` provides character classification/conversion.
- Be careful with signed `char` when calling `<cctype>` functions.
- ASCII-compatible encodings are common, but C++ does not require ASCII specifically.

**Key idea:** `char` stores a character representation; `<cctype>` provides common character operations.
