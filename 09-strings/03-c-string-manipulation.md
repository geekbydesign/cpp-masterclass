# C-String Manipulation

Include:

```cpp
#include <cstring>
```

## Common Functions

### Length

```cpp
std::strlen(text);
```

### Compare

```cpp
std::strcmp(a, b);
```

Returns negative, zero, or positive depending on lexical ordering.

### Find Character

```cpp
const char* result = std::strchr(text, 'e');
```

Returns a pointer to the matching character or `nullptr`.

### Find Substring

```cpp
const char* result = std::strstr(text, "world");
```

Returns a pointer to the first match or `nullptr`.

### Tokenization

```cpp
char text[] = "red,green,blue";

char* token = std::strtok(text, ",");

while (token != nullptr)
{
    std::cout << token << '\n';
    token = std::strtok(nullptr, ",");
}
```

`strtok` modifies the input buffer and has stateful behavior.

## Safety

C-string functions generally do not know destination buffer size. Ensure sufficient storage before copying or concatenating.

## Modern C++

Prefer:

```cpp
std::string
std::string_view
```

for most modern C++ code.

## Interview Points

Know:

```cpp
strlen
strcmp
strchr
strstr
strtok
```

**Key idea:** C-string functions operate on null-terminated character sequences and require careful buffer management.
