# Escape Sequences

Escape sequences represent special characters inside character and string literals.

| Escape | Meaning |
|---|---|
| `\n` | Newline |
| `\t` | Horizontal tab |
| `\\` | Backslash |
| `\"` | Double quote |
| `\'` | Single quote |
| `\0` | Null character |
| `\r` | Carriage return |
| `\b` | Backspace |
| `\a` | Alert/bell |
| `\f` | Form feed |
| `\v` | Vertical tab |
| `\?` | Question mark |

## Examples

```cpp
std::cout << "Hello\nWorld";
```

```cpp
std::cout << "He said \"Hello\"";
```

```cpp
std::string path = "C:\\Users\\Sachin";
```

## Null Character

```cpp
char ch = '\0';
```

Important for C-strings.

## Numeric Escapes

```cpp
'\x41'
```

commonly represents `A` in ASCII-compatible execution character sets.

Be careful because hexadecimal digits continue to be consumed as part of a hexadecimal escape.

## Interview Point

Know the difference:

```cpp
'\0'  // null character
"\0"  // string containing a null character plus its terminating null
```

**Key idea:** Escape sequences allow special characters to be represented inside literals.
