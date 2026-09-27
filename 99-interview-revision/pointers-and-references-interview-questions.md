# Pointers and References Interview Questions

## 1. Pointer vs reference?

```text
pointer   → can be null and reseated
reference → normally aliases an existing object and cannot be reseated
```

## 2. What is `nullptr`?

A type-safe null pointer literal introduced in C++11.

```cpp
int* p = nullptr;
```

## 3. What is pointer arithmetic?

For a pointer into an array:

```cpp
int values[5];

int* p = values;

++p;
```

advances by one `int`, not one byte.

Pointer arithmetic outside the relevant array object is not generally valid.

## 4. What is array decay?

In many expressions, an array converts to a pointer to its first element.

```cpp
int values[3];

int* p = values;
```

But arrays and pointers are different types.

## 5. How do you preserve an array type?

```cpp
void process(int (&values)[3]);
```

The parameter is a reference to the entire array.

## 6. What is `const int*`?

Pointer to const:

```cpp
const int* p;
```

You cannot modify the pointed-to `int` through `p`.

## 7. What is `int* const`?

Const pointer:

```cpp
int* const p = &x;
```

The pointer cannot be reseated, but the pointed-to `int` can be modified.

## 8. What is `const int* const`?

Both are const:

```cpp
const int* const p = &x;
```

## 9. What is a dangling pointer?

A pointer whose referenced object no longer exists.

## 10. What is a dangling reference?

A reference whose referred object's lifetime has ended.

## 11. Can a reference be null?

A valid reference is expected to refer to an object/function. Do not model nullable relationships with references; use a pointer or an appropriate optional abstraction.

## 12. What is a pointer to a member function?

```cpp
std::thread t(&Worker::process, &worker);
```

`&Worker::process` is a pointer to member function.

## 13. What is `void*`?

A pointer to unspecified object type.

```cpp
void* p;
```

It loses static type information and generally requires conversion before typed access.

Prefer templates, typed pointers, or type-safe abstractions when possible.

## 14. What is pointer-to-pointer?

```cpp
int** p;
```

It points to an object that is itself an `int*`.

## 15. What is pointer-to-array?

```cpp
int (*p)[3];
```

It points to an entire array of three `int`s.

## 16. Why use references for function parameters?

References can express that an existing object is required and can avoid copying.

```cpp
void process(const Widget& value);
```

## 17. When should a function take a pointer?

A pointer can be appropriate when:
- Null is meaningful.
- Pointer semantics are required.
- Interoperating with APIs.
- Pointer arithmetic is relevant.

## 18. What is `std::string_view` or `std::span`?

They are non-owning views that can often express read-only/borrowed data more clearly than raw pointers and sizes.
