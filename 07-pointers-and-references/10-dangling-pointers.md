# Dangling Pointers

## 1. What Is a Dangling Pointer?

A dangling pointer points to an object whose lifetime has ended or to storage that is no longer valid.

```cpp
int* p;

{
    int value = 10;
    p = &value;
}

// value no longer exists
// p is dangling
```

Dereferencing `p` is undefined behavior.

## 2. Returning a Local Address

Incorrect:

```cpp
int* getValue()
{
    int value = 10;
    return &value;
}
```

`value` is destroyed when the function returns.

## 3. Use-After-Free

```cpp
int* p = new int(10);

delete p;

// p is dangling
```

Dereferencing it after `delete` is undefined behavior.

## 4. Common Causes

- Returning the address of a local object.
- Using a pointer after `delete`.
- Keeping a pointer after the pointed-to object's lifetime ends.
- Pointer invalidation after certain container operations.

## 5. Nulling After Manual Delete

```cpp
delete p;
p = nullptr;
```

This does not restore the object, but prevents `p` from continuing to contain the old address.

## 6. Better Approach

Prefer RAII and smart pointers:

```cpp
auto p = std::make_unique<int>(10);
```

## Interview Point

```text
nullptr  -> points to no object
dangling -> points to an object/storage that is no longer valid
```

**Key idea:** Pointer validity depends on the lifetime of the object it points to.
