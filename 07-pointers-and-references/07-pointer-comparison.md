# Pointer Comparison

## Equality

Pointers can be compared for equality:

```cpp
int a = 10;
int* p = &a;
int* q = &a;

if (p == q)
{
    // same pointer value
}
```

## Compare With `nullptr`

```cpp
if (p == nullptr)
{
    // null
}
```

Also:

```cpp
if (p) { }
if (!p) { }
```

## Relational Comparison

For pointers into the same array:

```cpp
int arr[5];

int* p = &arr[1];
int* q = &arr[4];

if (p < q)
{
    // true
}
```

Do not treat arbitrary pointers to unrelated objects as ordinary integers with meaningful `<`/`>` ordering.

## Pointer Difference

```cpp
int arr[10];

int* first = &arr[2];
int* last = &arr[7];

std::ptrdiff_t distance = last - first;
```

Result:

```text
5
```

## Interview Points

- `==` and `!=` are commonly used for pointer identity/null checks.
- Relational comparisons are meaningful for positions within the same array.
- Pointer subtraction requires pointers into the same array context.

**Key idea:** Pointer comparison rules depend on the objects to which the pointers refer.
