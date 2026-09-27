# String Comparison

## Equality

```cpp
std::string a = "Hello";
std::string b = "Hello";

if (a == b)
{
}
```

## Relational Operators

```cpp
a < b
a > b
a <= b
a >= b
```

These compare string contents lexicographically.

## `compare()`

```cpp
int result = a.compare(b);
```

Result:

- `< 0` → `a` compares before `b`
- `0` → equal
- `> 0` → `a` compares after `b`

Do not rely on the exact non-zero value.

## C-String Comparison

```cpp
std::strcmp(a, b);
```

Do not compare C-string pointers when you want textual equality:

```cpp
// a == b  // pointer/address comparison if a and b are char pointers
```

## Interview Points

- `std::string` operators compare contents.
- Comparisons are lexicographical.
- `compare()` returns negative, zero, or positive.
- `strcmp()` compares C-strings.

**Key idea:** Distinguish comparing string contents from comparing pointer addresses.
