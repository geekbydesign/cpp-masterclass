# `inline` vs `static`

`inline` and namespace-scope `static` solve different problems.

## `static` at Namespace Scope

```cpp
static int value = 10;
```

This gives the variable internal linkage.

Each translation unit can have its own entity.

```text
file1.cpp -> value #1
file2.cpp -> value #2
```

## `inline` Variable

```cpp
inline int value = 10;
```

This allows the same inline variable to be defined in multiple translation units, subject to ODR rules.

Conceptually, those declarations refer to one program-wide entity.

## Comparison

| Feature | `static` namespace variable | `inline` variable |
|---|---|---|
| Linkage | Internal | Usually external unless otherwise specified |
| Multiple TU definitions | Separate entities | Same inline entity |
| Common use | TU-local implementation detail | Header-defined shared variable |
| C++ version | Old | C++17 for inline variables |

## Functions

At namespace scope:

```cpp
static void helper();
```

gives internal linkage.

```cpp
inline void helper();
```

allows an inline function definition in multiple translation units when ODR requirements are met.

## Interview Tip

Do not say "`static` means one copy."

At namespace scope, it generally means **internal linkage**.

For static data members, the meaning is different: the member belongs to the class rather than each object.
