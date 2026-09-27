# Literals

A literal is a value written directly in C++ source code.

Examples:

```cpp
42
3.14
'A'
"Hello"
true
nullptr
```

## 1. Integer Literals

```cpp
42
-42
0
```

Different bases are supported:

```cpp
42      // decimal
052     // octal
0x2A    // hexadecimal
0b101010 // binary, C++14+
```

Be careful:

```cpp
int value = 010;
```

`010` is octal, so its value is `8`.

## 2. Integer Suffixes

Suffixes can specify the intended type.

```cpp
42U      // unsigned
42L      // long
42LL     // long long
42UL     // unsigned long
42ULL    // unsigned long long
```

Example:

```cpp
auto value = 42LL;
```

The deduced type is `long long`.

## 3. Floating-Point Literals

```cpp
3.14
3.14f
3.14L
```

Typical types:

```text
3.14  → double
3.14f → float
3.14L → long double
```

Scientific notation:

```cpp
1.5e3
2.5e-4
```

## 4. Character Literals

```cpp
'A'
'7'
'\n'
'\t'
```

A character literal such as `'A'` has type `char` in the ordinary character literal form.

## 5. String Literals

```cpp
"Hello"
"Hello\n"
```

A string literal is an array of characters with a terminating null character.

```cpp
const char* text = "Hello";
```

Do not attempt to modify a string literal.

## 6. Boolean Literals

```cpp
true
false
```

Type:

```cpp
bool
```

## 7. `nullptr`

```cpp
int* ptr = nullptr;
```

`nullptr` represents a null pointer value and has type `std::nullptr_t`.

Prefer:

```cpp
nullptr
```

over:

```cpp
NULL
0
```

when representing a null pointer.

## 8. Digit Separators

C++14 supports digit separators:

```cpp
int value = 1'000'000;
long long distance = 10'000'000'000LL;
```

They improve readability and do not change the value.

## 9. Raw String Literals

A raw string literal avoids normal escaping for many characters.

```cpp
const char* path = R"(C:\temp\file.txt)";
```

Raw strings are covered in more detail in the strings section.

## Quick Revision

```text
42       → integer literal
3.14     → double literal
3.14f    → float literal
'A'      → character literal
"Hello"  → string literal
true     → bool literal
nullptr  → null pointer literal
0xFF     → hexadecimal
0b1010   → binary
```

## Interview Points

- Integer literals can be decimal, octal, hexadecimal, or binary.
- A leading `0` can indicate octal.
- `3.14` is a `double` literal by default.
- `nullptr` is a type-safe null pointer value.
- Digit separators improve readability.
