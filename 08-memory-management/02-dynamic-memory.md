# Dynamic Memory

## 1. What Is Dynamic Memory?

Dynamic storage allows an object to have a lifetime independent of the scope where allocation occurs.

```cpp
int* p = new int(42);
```

## 2. Single Object

```cpp
int* p = new int(42);
std::cout << *p;
delete p;
p = nullptr;
```

## 3. Initialization

```cpp
int* p = new int;   // default-initialized int: indeterminate value
int* q = new int{}; // value-initialized: zero
```

## 4. Dynamic Class Object

```cpp
Employee* e = new Employee();
delete e;
```

`new` constructs the object; `delete` destroys it and releases its storage.

## 5. Modern C++

Prefer RAII:

```cpp
auto p = std::make_unique<int>(42);
```

Use `std::make_shared` only when shared ownership is actually required.

## Interview Points

- Dynamic storage lifetime is independent of the allocating scope.
- `new` creates/initializes an object in dynamic storage.
- Raw pointers do not inherently express ownership.

**Key idea:** Dynamic memory is powerful, but manual ownership is error-prone.
