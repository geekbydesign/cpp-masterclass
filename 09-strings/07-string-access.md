# String Access

## `operator[]`

```cpp
std::string text = "Hello";

char ch = text[1]; // 'e'
```

No bounds checking.

## `at()`

```cpp
char ch = text.at(1);
```

Throws `std::out_of_range` for an invalid position.

## `front()` and `back()`

```cpp
char first = text.front();
char last = text.back();
```

The string must not be empty.

## Modify

```cpp
text[0] = 'Y';
```

## Range-Based `for`

```cpp
for (char ch : text)
{
    std::cout << ch;
}
```

Modify in place:

```cpp
for (char& ch : text)
{
    ch = static_cast<char>(
        std::toupper(static_cast<unsigned char>(ch))
    );
}
```

## Iterators

```cpp
for (auto it = text.begin(); it != text.end(); ++it)
{
    std::cout << *it;
}
```

## Quick Comparison

| Access | Bounds checking |
|---|---|
| `text[i]` | No |
| `text.at(i)` | Yes |
| `front()` | No |
| `back()` | No |

**Key idea:** Use `at()` when checked access is required; `[]` for normal unchecked indexing.
