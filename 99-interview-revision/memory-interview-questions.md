# Memory Interview Questions

## 1. What are typical program memory regions?

A simplified model:

```text
Code/Text
Read-only data
Global/static data
Heap
Stack
```

Actual layouts vary by platform and ABI.

## 2. Stack vs heap?

Stack storage is normally automatic and scope/lifetime driven.

Heap storage is dynamic and requires an ownership/lifetime strategy.

## 3. What is RAII?

Tie resource lifetime to object lifetime and release the resource in the destructor.

## 4. What is a memory leak?

Allocated resource remains unreachable or is no longer properly released.

```cpp
int* p = new int(10);
// lost without delete
```

Prefer:

```cpp
auto p = std::make_unique<int>(10);
```

## 5. What is use-after-free?

Accessing an object after its lifetime has ended.

```cpp
delete p;
*p = 10; // UB
```

## 6. What is a dangling pointer/reference?

It refers to storage whose object lifetime has ended.

## 7. What is double deletion?

Releasing the same resource twice.

This is undefined behavior.

## 8. What is shallow copy vs deep copy?

Shallow copy copies the resource handle/pointer.

Deep copy duplicates the owned resource.

## 9. What is `unique_ptr`?

Exclusive ownership.

```cpp
auto p = std::make_unique<Widget>();
```

It is moveable but not copyable.

## 10. What is `shared_ptr`?

Shared ownership through a control block and reference counting.

## 11. What is `weak_ptr`?

A non-owning observer of an object managed by `shared_ptr`.

```cpp
if (auto p = weak.lock())
{
}
```

## 12. What is the control block?

A `shared_ptr` control block typically contains ownership/reference-counting information and possibly a deleter/allocator-related state.

## 13. `make_shared` vs separate `new`?

```cpp
auto p = std::make_shared<Widget>();
```

is generally preferred because it is concise and can allocate the object and control block efficiently.

## 14. Why not use `shared_ptr` everywhere?

Shared ownership has cost and obscures ownership semantics.

Prefer:

```text
value → normal object
unique_ptr → exclusive ownership
shared_ptr → actual shared ownership
weak_ptr → non-owning observation
```

## 15. What is alignment?

Objects have alignment requirements that can introduce padding.

```cpp
alignof(T)
```

reports the alignment requirement.

## 16. What is object lifetime?

An object's lifetime begins and ends according to C++ object-lifetime rules. Access outside the lifetime can be undefined behavior.

## 17. What is placement `new`?

It constructs an object in already-provided storage:

```cpp
new (buffer) Widget;
```

The storage and object lifetime must be managed carefully.

## 18. Why is manual memory management dangerous?

Because ownership, lifetime, exception paths, copying, moving, and cleanup all become responsibilities of the programmer.

RAII and standard containers eliminate many such problems.
