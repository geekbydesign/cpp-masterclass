# Const Pointer

## Syntax

```cpp
int* const ptr = &value;
```

`ptr` is a const pointer to an `int`.

The pointer itself cannot be changed after initialization.

```cpp
int a = 10;
int b = 20;

int* const ptr = &a;

*ptr = 30; // valid
// ptr = &b; // error
```

## Important Difference

```cpp
const int* ptr;
```

Pointer can change; value cannot be modified through it.

```cpp
int* const ptr = &value;
```

Pointer cannot change; value can be modified.

## Initialization

A const pointer must be initialized:

```cpp
int* const ptr; // error
```

**Key idea:** `int* const` means a fixed pointer to a modifiable `int`.
