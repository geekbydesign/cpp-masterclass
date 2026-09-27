# Null Pointer Safety

## 1. Null Pointer

```cpp
int* p = nullptr;
```

It does not point to an object.

## 2. Never Dereference Null

```cpp
// *p = 10; // undefined behavior
```

## 3. Check Before Use

```cpp
if (p)
{
    std::cout << *p;
}
```

## 4. Prefer References When Null Is Invalid

If a function requires a valid object:

```cpp
void process(int& value);
```

can be clearer than a nullable pointer:

```cpp
void process(int* value);
```

## 5. Smart Pointers Can Be Empty

```cpp
std::unique_ptr<int> p;

if (p)
    std::cout << *p;
```

## 6. Null vs Dangling

```text
nullptr  -> points to no object
dangling -> non-null pointer to invalid/dead storage
```

## Interview Point

Null checking solves one problem; a non-null pointer can still be dangling or otherwise invalid.

**Key idea:** Pointer safety requires both null-state and lifetime awareness.
