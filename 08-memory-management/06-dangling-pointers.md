# Dangling Pointers

## 1. Definition

A dangling pointer points to an object or storage whose lifetime has ended.

```cpp
int* p;
{
    int value = 10;
    p = &value;
}
// p is dangling
```

## 2. After `delete`

```cpp
int* p = new int(10);
delete p;
// *p is undefined behavior
```

You may set it to null:

```cpp
p = nullptr;
```

## 3. Returning a Local Address

Incorrect:

```cpp
int* getValue()
{
    int value = 10;
    return &value;
}
```

## 4. References Can Dangle Too

```cpp
int& getValue()
{
    int value = 10;
    return value; // invalid
}
```

## 5. Container Invalidation

Pointers/references/iterators can become invalid after operations that invalidate elements.

```cpp
std::vector<int> values;
values.push_back(10);
int* p = &values[0];
values.push_back(20); // may reallocate
// p may now be dangling
```

## Prevention

- Understand object lifetime.
- Do not return pointers/references to locals.
- Use RAII.
- Know container invalidation rules.

**Key idea:** A non-null pointer is not necessarily a valid pointer.
