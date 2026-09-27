# Multidimensional Array Parameters

For:

```cpp
int matrix[2][3];
```

a function can be written:

```cpp
void print(int matrix[][3], int rows)
{
    for (int i = 0; i < rows; ++i)
        for (int j = 0; j < 3; ++j)
            std::cout << matrix[i][j];
}
```

The first dimension may be omitted, but later dimensions must normally be known.

Equivalent pointer form:

```cpp
void print(int (*matrix)[3], int rows);
```

### Why?

Pointer arithmetic must know the size of each row to calculate the next row.

**Interview:** In `int matrix[][3]`, the `3` is required for normal array-parameter syntax.
