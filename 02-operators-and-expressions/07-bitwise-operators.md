# Bitwise Operators

Bitwise operators operate on the individual bits of integral values.

## 1. Operators

```text
&   bitwise AND
|   bitwise OR
^   bitwise XOR
~   bitwise NOT
<<  left shift
>>  right shift
```

These are different from logical operators:

```text
&&  logical AND
||  logical OR
!   logical NOT
```

## 2. Bitwise AND

```cpp
unsigned int a = 0b1100;
unsigned int b = 0b1010;

unsigned int result = a & b;
```

Result:

```text
1000
```

AND produces `1` only where both corresponding bits are `1`.

## 3. Bitwise OR

```cpp
unsigned int result = a | b;
```

A bit becomes `1` if either corresponding bit is `1`.

## 4. Bitwise XOR

```cpp
unsigned int result = a ^ b;
```

A bit becomes `1` when the corresponding bits are different.

Useful for toggling bits.

## 5. Bitwise NOT

```cpp
unsigned int result = ~a;
```

Every bit is inverted.

The exact numeric result depends on the type's width.

## 6. Left Shift

```cpp
unsigned int value = 1;

value << 3;
```

For appropriate unsigned values, this moves the bit pattern left by three positions.

Conceptually:

```text
00000001
    ↓
00001000
```

## 7. Right Shift

```cpp
unsigned int value = 8;

value >> 3;
```

Conceptually:

```text
00001000
    ↓
00000001
```

For unsigned values, zero bits are shifted in from the left.

For signed values, right-shift behavior must be considered according to the language rules; using unsigned integers for bit manipulation is often clearer.

## 8. Bit Masks

A mask selects particular bits.

```cpp
unsigned int flags = 0b10110100;
unsigned int mask  = 0b00001111;

unsigned int lower = flags & mask;
```

This extracts the lower four bits.

## 9. Set a Bit

```cpp
flags |= (1u << 3);
```

Sets bit 3.

## 10. Clear a Bit

```cpp
flags &= ~(1u << 3);
```

Clears bit 3.

## 11. Toggle a Bit

```cpp
flags ^= (1u << 3);
```

Toggles bit 3.

## 12. Test a Bit

```cpp
if ((flags & (1u << 3)) != 0)
{
    // bit 3 is set
}
```

## 13. Signed Values

Bitwise operations on signed integers can be harder to reason about because of representation and shift rules.

For low-level bit manipulation, unsigned integer types are usually preferable.

## Quick Revision

```text
&  → AND
|  → OR
^  → XOR
~  → NOT
<< → left shift
>> → right shift
```

Common mask operations:

```cpp
flags |= mask;   // set
flags &= ~mask;  // clear
flags ^= mask;   // toggle
flags & mask     // test/extract
```

## Interview Points

- Bitwise operators work on integral bit patterns.
- `&` is not the same as `&&`.
- `|` is not the same as `||`.
- Masks are fundamental in flags, permissions, protocols, and embedded systems.
- Prefer unsigned types when performing low-level bit manipulation.
