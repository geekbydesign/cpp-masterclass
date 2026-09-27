# Stack and Heap

## 1. Stack

The stack is commonly used for objects with automatic storage duration.

```cpp
void function()
{
    int value = 10;
    double price = 20.5;
}
```

Their lifetime normally ends when execution leaves the scope.

## 2. Dynamic Storage

Objects created using `new` use dynamic storage:

```cpp
int* p = new int(10);
delete p;
```

The pointer `p` itself may be a local object while the allocated `int` uses dynamic storage.

## 3. Conceptual Difference

```text
Automatic storage -> commonly stack
Dynamic storage   -> commonly heap
```

"Stack" and "heap" are implementation concepts. C++ primarily specifies storage duration and object lifetime.

## 4. Stack Exhaustion

Large automatic objects or excessive recursion can exhaust stack space.

## 5. Interview Points

- Local objects commonly have automatic storage duration.
- `new` obtains dynamic storage.
- Pointer lifetime and pointee lifetime can differ.
- Modern C++ prefers RAII over manual ownership.

**Key idea:** Do not confuse the lifetime of a pointer with the lifetime of the object it points to.
