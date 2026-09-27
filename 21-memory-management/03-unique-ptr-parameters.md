# `unique_ptr` Parameters

The parameter type communicates ownership intent.

## Transfer Ownership

If a function should take ownership:

```cpp
void process(std::unique_ptr<Resource> resource)
{
    // owns resource
}
```

Call:

```cpp
auto resource = std::make_unique<Resource>();

process(std::move(resource));
```

The caller explicitly transfers ownership.

## Borrow Without Ownership

If the function only needs to use the object:

```cpp
void process(Resource& resource);
```

or:

```cpp
void process(const Resource& resource);
```

A smart pointer is usually unnecessary for a non-owning operation.

## Observe Through Pointer

For nullable non-owning access:

```cpp
void process(Resource* resource);
```

## Why Not `const unique_ptr&` Everywhere?

This:

```cpp
void process(const std::unique_ptr<Resource>& resource);
```

means the function observes the smart pointer itself without taking ownership.

If the function only needs the `Resource`, prefer:

```cpp
void process(const Resource& resource);
```

## Rule of Thumb

```text
take ownership      -> unique_ptr<T> by value
borrow, non-null    -> T&
borrow, nullable    -> T*
transfer explicitly -> std::move(unique_ptr)
```

## Interview Tip

Parameter types should express **ownership semantics**, not merely implementation convenience.
