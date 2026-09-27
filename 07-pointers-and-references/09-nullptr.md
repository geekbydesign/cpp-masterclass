# `nullptr`

## 1. What Is `nullptr`?

`nullptr` is the modern C++ null pointer literal introduced in C++11.

```cpp
int* p = nullptr;
```

## 2. Check for Null

```cpp
if (p == nullptr)
{
    // null
}
```

Or:

```cpp
if (!p)
{
    // null
}
```

## 3. Do Not Dereference

```cpp
int* p = nullptr;

// *p; // undefined behavior
```

## 4. `nullptr` vs `NULL`

Prefer:

```cpp
int* p = nullptr;
```

over:

```cpp
int* p = NULL;
```

`nullptr` has type:

```cpp
std::nullptr_t
```

## 5. Why It Is Better

```cpp
void f(int);
void f(int*);

f(0);       // int overload
f(nullptr); // pointer overload
```

`nullptr` avoids the integer/null-pointer ambiguity of `0` and traditional `NULL`.

## 6. Null vs Uninitialized

```cpp
int* p = nullptr; // deliberately null
int* q;           // uninitialized
```

`q` must not be dereferenced.

**Key idea:** Prefer `nullptr` for null pointers in modern C++.
