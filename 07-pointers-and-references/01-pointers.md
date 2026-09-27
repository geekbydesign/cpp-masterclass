# Pointers

## 1. What Is a Pointer?

A pointer is an object that stores the address of another object.

```cpp
int value = 42;
int* ptr = &value;
```

- `&value` → address of `value`
- `ptr` → stores that address
- `*ptr` → accesses the object through the pointer

## 2. Basic Example

```cpp
int value = 42;
int* ptr = &value;

std::cout << ptr;   // address
std::cout << *ptr;  // 42
```

## 3. Modify Through a Pointer

```cpp
*ptr = 100;
```

Now `value` is `100`.

## 4. Pointer Declaration

```cpp
int* p;
double* d;
char* c;
```

The pointer type determines the type of object accessed through it and how pointer arithmetic works.

## 5. Pointer to Pointer

```cpp
int value = 10;
int* p = &value;
int** pp = &p;

std::cout << **pp; // 10
```

## 6. Pointer Size

The size of a pointer generally depends on the architecture, not the pointed-to type.

```cpp
sizeof(int*)
sizeof(double*)
sizeof(char*)
```

On a typical 64-bit system, these are commonly 8 bytes.

## 7. Uninitialized Pointer

```cpp
int* p; // uninitialized local pointer
```

Dereferencing it is undefined behavior.

## Interview Points

- A pointer stores an address.
- `&` obtains an address.
- `*` dereferences a pointer.
- An uninitialized pointer must not be dereferenced.

**Key idea:** A pointer gives indirect access to an object through its address.
