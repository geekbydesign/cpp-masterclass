# `new` and `delete`

## 1. `new`

```cpp
int* p = new int(10);
```

`new` obtains storage, creates/initializes the object, and returns its address.

## 2. `delete`

```cpp
delete p;
```

For a single object, `delete` destroys the object and releases the corresponding storage.

## 3. `new[]` and `delete[]`

```cpp
int* arr = new int[5];
delete[] arr;
```

Match the forms:

```text
new     -> delete
new[]   -> delete[]
```

## 4. Constructors and Destructors

```cpp
class Test {
public:
    Test()  { std::cout << "Constructed\n"; }
    ~Test() { std::cout << "Destroyed\n"; }
};

Test* p = new Test();
delete p;
```

`delete` invokes the destructor before releasing storage.

## 5. Common Errors

```cpp
delete p;
delete p; // double delete: undefined behavior
```

```cpp
int* p = new int[5];
delete p; // wrong form: undefined behavior
```

## 6. Prefer RAII

```cpp
auto p = std::make_unique<int>(10);
```

## Interview Point

Every raw allocation must have the appropriate corresponding deallocation unless ownership is transferred to an RAII owner.
