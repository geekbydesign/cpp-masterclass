# Smart Pointer Best Practices

Smart pointers express ownership and automate lifetime management.

## 1. Prefer Values When Possible

If an object can simply be stored by value:

```cpp
Resource resource;
```

prefer that over unnecessary dynamic allocation.

## 2. Prefer `unique_ptr` for Exclusive Ownership

```cpp
auto resource = std::make_unique<Resource>();
```

Use `unique_ptr` unless ownership genuinely needs to be shared.

## 3. Use `shared_ptr` Only for Shared Ownership

```cpp
auto resource = std::make_shared<Resource>();
```

Do not use `shared_ptr` just to avoid thinking about ownership.

It adds:

- control-block overhead
- reference counting
- more complex lifetime behavior

## 4. Use `weak_ptr` to Observe

Use `weak_ptr` when:

- observing a shared object without owning it
- breaking `shared_ptr` cycles

## 5. Prefer Factory Functions

Prefer:

```cpp
auto p = std::make_unique<Resource>(args);
```

and:

```cpp
auto p = std::make_shared<Resource>(args);
```

over direct `new` in most application code.

## 6. Avoid Owning Raw Pointers

Avoid:

```cpp
Resource* p = new Resource;
```

when ownership can be represented with RAII.

Raw pointers are still useful for **non-owning observation**.

## 7. Do Not Call `delete` on Smart-Pointer-Owned Objects

```cpp
auto p = std::make_unique<Resource>();

delete p.get(); // wrong
```

The smart pointer owns the resource and will delete it.

## 8. Be Careful With `.get()`

```cpp
Resource* raw = p.get();
```

`raw` does not own the resource.

Do not store/use it beyond the lifetime of the smart pointer without ensuring validity.

## 9. Do Not Use `shared_ptr` for Thread Safety

A `shared_ptr` manages ownership.

It does not automatically make:

```cpp
*ptr
```

safe for concurrent modification.

Synchronization is a separate concern.

## 10. Watch for Cycles

```text
A -> shared_ptr<B>
B -> shared_ptr<A>
```

can leak both objects.

Use `weak_ptr` for a non-owning relationship.

## Ownership Decision

```text
Can store by value?
        |
        +-- yes -> T
        |
        +-- no
             |
             +-- one owner -> unique_ptr<T>
             |
             +-- shared ownership -> shared_ptr<T>
                              |
                              +-- non-owning back/reference -> weak_ptr<T>
```

## Interview Summary

| Type | Ownership |
|---|---|
| `T` | Value ownership/lifetime |
| `unique_ptr<T>` | Exclusive ownership |
| `shared_ptr<T>` | Shared ownership |
| `weak_ptr<T>` | Non-owning observation |
| `T*` | Usually non-owning pointer unless explicitly documented otherwise |
| `T&` | Non-owning reference, normally non-null |

## Golden Rule

> Choose the simplest ownership model that correctly expresses the lifetime relationship.
