# Pointer vs Reference

## Basic Difference

Pointer:

```cpp
int value = 10;
int* p = &value;
```

Reference:

```cpp
int value = 10;
int& ref = value;
```

## Comparison

| Feature | Pointer | Reference |
|---|---|---|
| Can be null | Yes | No valid null reference |
| Must initialize | No | Yes |
| Can be reseated | Yes | No |
| Explicit dereference | Yes, `*p` | No |
| Pointer arithmetic | Yes | No |
| Can represent no object | Yes | No |

## Pointer Can Be Reseated

```cpp
int a = 10;
int b = 20;

int* p = &a;
p = &b;
```

## Reference Cannot Be Reseated

```cpp
int a = 10;
int b = 20;

int& ref = a;

ref = b;
```

This assigns `b`'s value to `a`; it does not make `ref` refer to `b`.

## Function Parameters

Pointer:

```cpp
void update(int* p)
{
    *p = 100;
}
```

Reference:

```cpp
void update(int& value)
{
    value = 100;
}
```

## When to Use

Use a pointer when you need:

- Nullability.
- Reseating.
- Pointer arithmetic.
- Low-level memory operations.

Use a reference when the object is required and alias semantics are appropriate.

**Key idea:** A reference behaves as an alias; a pointer is an object that stores an address.
