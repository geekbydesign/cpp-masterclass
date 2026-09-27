# Multidimensional Arrays

## 1. Two-Dimensional Array

```cpp
int matrix[2][3];
```

This represents:

```text
2 rows × 3 columns
```

## 2. Initialization

```cpp
int matrix[2][3] =
{
    {1, 2, 3},
    {4, 5, 6}
};
```

## 3. Access

```cpp
matrix[0][0]; // 1
matrix[1][2]; // 6
```

Syntax:

```cpp
matrix[row][column]
```

## 4. Nested Loops

```cpp
for (int row = 0; row < 2; ++row)
{
    for (int col = 0; col < 3; ++col)
    {
        std::cout << matrix[row][col] << ' ';
    }

    std::cout << '\n';
}
```

## 5. Partial Initialization

```cpp
int matrix[2][3] =
{
    {1, 2},
    {3}
};
```

Remaining elements are zero:

```text
1 2 0
3 0 0
```

## 6. Memory Layout

C++ stores multidimensional arrays in **row-major order**.

For:

```cpp
int matrix[2][3] =
{
    {1, 2, 3},
    {4, 5, 6}
};
```

The memory order is:

```text
1 2 3 4 5 6
```

## 7. Higher Dimensions

```cpp
int cube[2][3][4];
```

Access:

```cpp
cube[i][j][k];
```

## Interview Points

- `int arr[R][C]` has `R` rows and `C` columns.
- Indexing starts at zero for each dimension.
- Elements are stored contiguously.
- C++ uses row-major layout.

**Key idea:** Multidimensional arrays are arrays whose elements are themselves arrays.
