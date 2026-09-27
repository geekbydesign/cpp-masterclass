# Bitwise Compound Assignment

Bitwise operations also have compound assignment forms.

## 1. Operators

```text
&=
|=
^=
<<=
>>=
```

## 2. AND Assignment

```cpp
unsigned int flags = 0b11110000;

flags &= 0b00001111;
```

Result:

```text
00000000
```

Equivalent in simple form to:

```cpp
flags = flags & 0b00001111;
```

## 3. OR Assignment

```cpp
unsigned int flags = 0;

flags |= (1u << 2);
```

This sets bit 2.

Equivalent conceptually to:

```cpp
flags = flags | (1u << 2);
```

## 4. XOR Assignment

```cpp
flags ^= (1u << 2);
```

This toggles bit 2.

## 5. Left Shift Assignment

```cpp
unsigned int value = 1;

value <<= 3;
```

Result:

```text
8
```

Conceptually:

```text
00000001 → 00001000
```

## 6. Right Shift Assignment

```cpp
unsigned int value = 16;

value >>= 2;
```

Result:

```text
4
```

## 7. Flags Example

```cpp
constexpr unsigned int Read  = 1u << 0;
constexpr unsigned int Write = 1u << 1;
constexpr unsigned int Exec  = 1u << 2;

unsigned int permissions = 0;

permissions |= Read;
permissions |= Write;
```

Check:

```cpp
if ((permissions & Write) != 0)
{
    // write permission is enabled
}
```

Remove:

```cpp
permissions &= ~Write;
```

Toggle:

```cpp
permissions ^= Exec;
```

## Quick Revision

```text
flags |= mask;   // set bits
flags &= ~mask;  // clear bits
flags ^= mask;   // toggle bits

value <<= n;     // shift left
value >>= n;     // shift right
```

## Interview Point

Bitwise compound assignment is especially common in:

- device flags
- permissions
- embedded programming
- protocol fields
- packed state
- feature flags
