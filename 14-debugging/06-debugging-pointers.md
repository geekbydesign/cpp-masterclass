# Debugging Pointers

Pointer bugs can cause:

- null-pointer dereference
- dangling pointers
- use-after-free
- invalid memory access
- double deletion
- memory corruption

## Null pointer

```cpp
int* p = nullptr;

*p = 10; // undefined behavior
```

Check before dereferencing when null is possible:

```cpp
if (p != nullptr)
{
    *p = 10;
}
```

## Inspect a pointer

In the debugger, inspect:

```cpp
p
*p
```

A pointer's address alone does not prove that the pointed-to object is valid.

## Dangling pointer

```cpp
int* p = new int(10);

delete p;

*p = 20; // undefined behavior
```

After deletion:

```cpp
p = nullptr;
```

can prevent accidental reuse of that particular pointer, but it does not fix other aliases.

## Use-after-free

Typical sequence:

```text
allocation
   ↓
pointer copied
   ↓
object destroyed
   ↓
old pointer used
```

Use breakpoints around allocation/destruction and inspect the call stack.

## Pointer to local variable

```cpp
int* getPointer()
{
    int value = 10;
    return &value; // dangling after return
}
```

The address may still look valid in a debugger, but the object lifetime has ended.

## Pointer arithmetic

```cpp
int values[] = {10, 20, 30};

int* p = values;

++p;
```

Inspect:

```cpp
p
*p
```

to understand the current element.

## Debugging memory corruption

Memory corruption may occur long before the eventual crash.

Useful approach:

```text
Find crash
   ↓
Inspect pointer/reference
   ↓
Check object lifetime
   ↓
Inspect call stack
   ↓
Set breakpoints around allocation/free
   ↓
Find first invalid operation
```

## Prefer RAII

Modern C++ should usually avoid manual ownership when possible:

```cpp
auto p = std::make_unique<int>(10);
```

The object is automatically destroyed when its owner goes out of scope.

## Interview checklist

For a pointer crash, ask:

1. Is the pointer null?
2. Does it point to a live object?
3. Was the object already destroyed?
4. Is it within valid object/array bounds?
5. Who owns the object?
6. Could memory have been corrupted earlier?
