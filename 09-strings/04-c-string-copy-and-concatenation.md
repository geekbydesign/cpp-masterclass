# C-String Copy and Concatenation

Include:

```cpp
#include <cstring>
```

## Copy

```cpp
char source[] = "Hello";
char destination[20];

std::strcpy(destination, source);
```

The destination must have enough room for the source and `\0`.

## `strncpy`

```cpp
std::strncpy(destination, source, sizeof(destination));
```

Be careful: `strncpy` does not always append `\0`.

## Concatenation

```cpp
char result[30] = "Hello ";
std::strcat(result, "World");
```

Result:

```text
Hello World
```

The destination must have sufficient capacity.

## Prefer `std::string`

Instead of:

```cpp
char result[100] = "Hello ";
std::strcat(result, "World");
```

prefer:

```cpp
std::string result = "Hello ";
result += "World";
```

## Common Errors

```cpp
char dest[5];
std::strcpy(dest, "Hello");
```

There is no room for the null terminator.

## Interview Points

- `strcpy` copies a C-string including `\0`.
- `strcat` appends a C-string.
- Destination capacity must be sufficient.
- `strncpy` has subtle null-termination behavior.
- Modern C++ generally prefers `std::string`.

**Key idea:** Most C-string copy/concatenation bugs involve buffer size and null termination.
