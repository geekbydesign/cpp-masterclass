# Character Arrays

## 1. Character Array

```cpp
char name[6] = {'S', 'a', 'c', 'h', 'i', 'n'};
```

This is a character array, but it is **not automatically a C-string** because there is no null terminator.

## 2. C-String

A C-string is a character array ending with:

```cpp
'\0'
```

Example:

```cpp
char name[] = "Sachin";
```

Memory:

```text
S a c h i n \0
```

The array requires 7 elements.

## 3. Manual Initialization

```cpp
char name[7] = {'S', 'a', 'c', 'h', 'i', 'n', '\0'};
```

## 4. Why `'\0'` Matters

C-string functions look for the null terminator.

```cpp
#include <cstring>

std::strlen(name);
```

Without `'\0'`, functions such as `strlen` may continue reading beyond the array.

## 5. Character Array vs `std::string`

C-style:

```cpp
char name[] = "Sachin";
```

Modern C++:

```cpp
std::string name = "Sachin";
```

`std::string` is generally safer and easier to use.

## 6. Common Functions

```cpp
std::strlen(str);
std::strcpy(destination, source);
std::strcmp(a, b);
std::strcat(destination, source);
```

These require:

```cpp
#include <cstring>
```

Be careful with buffer sizes when using C-string functions.

## Interview Points

- A C-string ends with `'\0'`.
- `"Hello"` has 5 visible characters but requires 6 elements as a C-string.
- A character array is not necessarily a C-string.
- `std::string` is usually preferred in modern C++.

**Key idea:** `'\0'` marks the end of a C-string.
