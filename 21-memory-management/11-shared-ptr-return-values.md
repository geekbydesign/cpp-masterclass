# `shared_ptr` Return Values

Returning `shared_ptr` communicates shared ownership to the caller.

```cpp
std::shared_ptr<Resource> createResource()
{
    return std::make_shared<Resource>();
}
```

Caller:

```cpp
auto resource = createResource();
```

## Multiple Owners

```cpp
auto a = createResource();
auto b = a;
```

Both objects share ownership.

## Factory Example

```cpp
std::shared_ptr<Shape> createShape()
{
    return std::make_shared<Circle>();
}
```

This is useful when the created object is intended to have shared lifetime.

## Do Not Use Automatically

If the caller should be the sole owner:

```cpp
std::unique_ptr<Resource> createResource();
```

may communicate a better ownership model.

If the object should be returned by value:

```cpp
Resource createResource();
```

may be even simpler.

## Decision

```text
return T                  -> value semantics
return unique_ptr<T>      -> exclusive ownership transfer
return shared_ptr<T>      -> shared ownership
```

## Interview Tip

Choose the return type based on the **ownership contract**, not merely because dynamic allocation is involved.
