# Data Types

C++ has fundamental types and user-defined/library types.

## 1. Fundamental Types

Common fundamental types:

```text
bool
char
signed char
unsigned char
short
unsigned short
int
unsigned int
long
unsigned long
long long
unsigned long long
float
double
long double
wchar_t
char8_t
char16_t
char32_t
```

`void` represents the absence of a value/type of object.

## 2. Boolean

```cpp
bool ready = true;
bool error = false;
```

A `bool` represents `true` or `false`.

## 3. Character Types

```cpp
char c = 'A';
```

C++ also provides:

```cpp
wchar_t
char8_t
char16_t
char32_t
```

Character types and their encodings are distinct concepts; `char` does not inherently mean ASCII.

## 4. Integer Types

Examples:

```cpp
int count = 10;
long long distance = 10000000000LL;
unsigned int flags = 0;
```

The exact size of fundamental types is implementation-defined within standard minimum guarantees.

Do not assume:

```cpp
sizeof(int) == 4
```

on every possible C++ implementation, although 4 bytes is common on modern platforms.

## 5. Floating-Point Types

```cpp
float f = 3.14f;
double d = 3.14;
long double ld = 3.14L;
```

`double` is generally the default choice for ordinary floating-point calculations unless a specific requirement calls for another type.

## 6. `void`

Used when there is no value.

```cpp
void print();
```

A pointer to `void` can point to an object of any object type:

```cpp
void* ptr;
```

but it must be converted to an appropriate pointer type before dereferencing.

## 7. Signed vs Unsigned

```cpp
int signedValue = -10;
unsigned int unsignedValue = 10;
```

Unsigned integers cannot represent negative values.

Be careful when signed and unsigned values interact because implicit conversions can produce surprising results.

## 8. `sizeof`

`sizeof` gives the size in bytes of an object or type.

```cpp
std::cout << sizeof(int);
std::cout << sizeof(double);
```

For an object:

```cpp
int value{};
std::cout << sizeof(value);
```

The result type is `std::size_t`.

## 9. `alignof`

`alignof` gives the alignment requirement of a type.

```cpp
std::cout << alignof(int);
```

Size and alignment are different concepts.

## 10. Minimum Guarantees

The C++ standard provides minimum ranges/sizes rather than one universal size for every fundamental type.

Important ordering:

```text
sizeof(char) <= sizeof(short)
                   <= sizeof(int)
                   <= sizeof(long)
                   <= sizeof(long long)
```

`sizeof(char)` is always `1`, where one byte is the size of a `char`.

## 11. Type Aliases

```cpp
using Count = unsigned int;
```

`Count` is an alias, not a new distinct type.

## 12. Type Deduction

`auto` can deduce a variable's type.

```cpp
auto count = 10;       // int
auto price = 12.5;     // double
```

See `06-auto.md`.

## 13. Numeric Limits

Use:

```cpp
#include <limits>
```

Example:

```cpp
std::cout << std::numeric_limits<int>::max();
std::cout << std::numeric_limits<int>::min();
```

For unsigned types, `min()` is `0`.

## 14. Type Categories

A useful broad classification:

```text
Fundamental types
    ↓
bool, char, integers, floating-point, void

Compound types
    ↓
pointers, references, arrays, functions

Class types
    ↓
class, struct, union

Enumeration types
    ↓
enum, enum class
```

## Interview Points

- `sizeof(char) == 1` by definition.
- `sizeof` returns `std::size_t`.
- Fundamental type sizes are implementation-dependent within standard requirements.
- `bool` represents logical truth values.
- Signed/unsigned conversions deserve careful attention.
- `sizeof` measures size; `alignof` measures alignment.
