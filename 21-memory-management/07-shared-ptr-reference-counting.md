# `shared_ptr` Reference Counting

`shared_ptr` uses a **control block** to manage shared ownership.

Conceptually:

```text
shared_ptr
    |
    v
control block
    |
    +-- strong reference count
    +-- weak reference count
    +-- deleter / allocator information
    |
    v
managed object
```

## Copying

```cpp
auto p1 = std::make_shared<int>(42);
auto p2 = p1;
```

The number of shared owners increases.

## Resetting

```cpp
p2.reset();
```

The ownership count decreases.

When the last owning `shared_ptr` disappears, the managed object is destroyed.

## `use_count()`

```cpp
std::cout << p1.use_count();
```

Useful for debugging, but generally should not be used as part of normal program logic.

## `make_shared`

```cpp
auto p = std::make_shared<MyClass>();
```

The implementation can commonly allocate the control block and object efficiently together.

## Thread Safety

Different `shared_ptr` objects that share ownership can generally be manipulated concurrently according to the library's thread-safety guarantees.

This does **not** make the managed object itself thread-safe.

```text
shared ownership safety != object data safety
```

## Cycles

Reference counting cannot automatically reclaim a cycle:

```text
A -> B
B -> A
```

Even when external owners disappear, the counts can remain non-zero.

Use `weak_ptr` for non-owning links that may otherwise form cycles.

## Interview Tip

`shared_ptr` manages **ownership count**, not synchronization of the object being owned.
