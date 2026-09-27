# Multidimensional Character Arrays

## 1. Array of C-Strings

A common use of a 2D character array is storing multiple words:

```cpp
char names[3][10] =
{
    "Sachin",
    "Rahul",
    "Amit"
};
```

Conceptually:

```text
names[0] -> "Sachin"
names[1] -> "Rahul"
names[2] -> "Amit"
```

Each row has space for 10 characters.

## 2. Access

```cpp
std::cout << names[0];    // Sachin
std::cout << names[1][0]; // R
```

## 3. Null Terminator

Each string requires a `'\0'`.

For:

```cpp
char names[3][10];
```

each row can contain at most **9 visible characters** when used as a C-string.

The 10th element is needed for `'\0'`.

## 4. Loop Through the Strings

```cpp
for (int i = 0; i < 3; ++i)
{
    std::cout << names[i] << '\n';
}
```

## 5. Different Lengths

Unused characters in a row are zero-initialized when using string-literal initialization:

```cpp
char names[3][10] =
{
    "Cat",
    "Dog",
    "Elephant"
};
```

The rows still occupy 10 characters each.

## 6. Memory Layout

A 2D character array uses contiguous storage:

```text
C a t \0 ...
D o g \0 ...
E l e p h a n t \0
```

## Interview Points

- A 2D character array can represent multiple fixed-size C-strings.
- Each row has its own storage.
- Every C-string requires a null terminator.
- Maximum visible string length is `column_count - 1`.

**Key idea:** `char words[N][M]` provides `N` fixed-size character buffers, each with capacity for at most `M - 1` visible characters as a C-string.
