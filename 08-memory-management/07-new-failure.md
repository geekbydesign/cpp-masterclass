# `new` Failure

## 1. Normal `new`

If a normal allocation cannot be satisfied, `new` throws `std::bad_alloc`.

```cpp
try
{
    int* p = new int[hugeSize];
}
catch (const std::bad_alloc& e)
{
    std::cerr << e.what();
}
```

Include:

```cpp
#include <new>
```

## 2. `std::nothrow`

```cpp
int* p = new (std::nothrow) int[100];

if (p == nullptr)
{
    // allocation failed
}
```

## 3. Compare

| Form | Allocation failure |
|---|---|
| `new T` | throws `std::bad_alloc` |
| `new (std::nothrow) T` | returns `nullptr` |

## 4. C Allocation

`std::malloc` obtains raw storage and does not construct a C++ object. Do not mix `malloc/free` with `new/delete`.

## Interview Points

- Normal `new` throws `std::bad_alloc`.
- `new (std::nothrow)` returns `nullptr`.
- Do not mix allocation/deallocation families.

**Key idea:** Know both exception-based and null-returning allocation failure.
