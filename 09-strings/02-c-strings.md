# C-Strings

## What Is a C-String?

A C-string is a null-terminated character sequence:

```cpp
char name[] = "Sachin";
```

Conceptually:

```text
S a c h i n \0
```

The array has 7 elements.

## Character Array vs C-String

This is not a C-string:

```cpp
char data[3] = {'A', 'B', 'C'};
```

This is:

```cpp
char data[] = {'A', 'B', 'C', '\0'};
```

## String Literal Initialization

```cpp
char text[] = "Hello";
```

The compiler includes the null terminator.

## C-String Length

```cpp
#include <cstring>

std::strlen(text);
```

`strlen` counts characters before `\0`; it does not count the terminator.

## String Literals

Treat string literals as non-modifiable:

```cpp
const char* text = "Hello";
```

## Interview Points

- A C-string must end with `\0`.
- `"Hello"` has 5 visible characters but needs 6 elements as a C-string.
- A character array is not necessarily a C-string.

**Key idea:** The null terminator defines where a C-string ends.
