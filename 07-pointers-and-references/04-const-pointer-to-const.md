# Const Pointer to Const

## Syntax

```cpp
const int* const ptr = &value;
```

This means:

- The pointer cannot be changed.
- The pointed-to value cannot be modified through the pointer.

```cpp
int value = 10;
int other = 20;

const int* const ptr = &value;

// *ptr = 30;  // error
// ptr = &other; // error
```

## Compare

| Declaration | Change pointer? | Modify value through pointer? |
|---|---:|---:|
| `const int* p` | Yes | No |
| `int* const p` | No | Yes |
| `const int* const p` | No | No |

## Interview Tip

The first `const` protects the value; the second `const` protects the pointer.

**Key idea:** `const int* const` is a fixed pointer to a read-only `int`.
