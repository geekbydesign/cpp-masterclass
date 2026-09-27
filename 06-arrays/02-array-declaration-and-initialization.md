# Array Declaration and Initialization

## 1. Declaration

```cpp
int arr[5];
```

Creates an array containing five `int` elements.

For a local array without initialization, the elements have **indeterminate values**.

## 2. Initialize All Elements

```cpp
int arr[5] = {1, 2, 3, 4, 5};
```

## 3. Partial Initialization

```cpp
int arr[5] = {1, 2};
```

Remaining elements are initialized to zero:

```text
1 2 0 0 0
```

## 4. Initialize Everything to Zero

```cpp
int arr[5] = {};
```

All elements become zero.

```text
0 0 0 0 0
```

## 5. Let Compiler Deduce Size

```cpp
int arr[] = {10, 20, 30, 40};
```

The compiler determines the size as `4`.

## 6. Character Array Initialization

```cpp
char word[] = "Hello";
```

The array contains:

```text
'H' 'e' 'l' 'l' 'o' '\0'
```

So its size is `6`.

## 7. Constant Expression for Size

```cpp
constexpr int SIZE = 5;
int arr[SIZE];
```

## 8. Common Mistake

```cpp
int arr[5] = {1, 2, 3, 4, 5, 6}; // error
```

Too many initializers.

## Quick Revision

```cpp
int a[5];              // declaration
int b[5] = {1, 2, 3};  // 1 2 3 0 0
int c[5] = {};         // all zero
int d[] = {1, 2, 3};   // size = 3
```

**Key idea:** The number of initializers cannot exceed the array size.
