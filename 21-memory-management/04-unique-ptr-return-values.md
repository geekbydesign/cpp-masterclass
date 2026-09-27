# `unique_ptr` Return Values

Returning `std::unique_ptr` is a clear way to transfer ownership to the caller.

```cpp
std::unique_ptr<Resource> createResource()
{
    return std::make_unique<Resource>();
}
```

Caller:

```cpp
auto resource = createResource();
```

## Ownership Transfer

```text
factory
   |
   | returns unique_ptr
   v
caller becomes owner
```

No manual `delete` is needed.

## Returning a Local

```cpp
std::unique_ptr<Resource> create()
{
    auto resource = std::make_unique<Resource>();
    return resource;
}
```

This works because `unique_ptr` is move-only and the return can use move semantics/copy elision as appropriate.

You generally do not need:

```cpp
return std::move(resource);
```

## Returning Raw Pointer vs `unique_ptr`

```cpp
Resource* create();              // ownership unclear
std::unique_ptr<Resource> create(); // ownership transferred
```

The smart pointer communicates the ownership contract directly.

## Factory Pattern

```cpp
std::unique_ptr<Shape> createShape()
{
    return std::make_unique<Circle>();
}
```

This works naturally with polymorphism when the base class has a virtual destructor.

## Interview Tip

Returning `unique_ptr` is usually preferable when the caller should become the owner of a dynamically allocated object.
