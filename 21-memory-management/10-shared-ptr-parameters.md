# `shared_ptr` Parameters

Parameter type should communicate how the function uses ownership.

## Shared Ownership

If the function should become a shared owner:

```cpp
void process(std::shared_ptr<Resource> resource);
```

The caller can pass:

```cpp
process(resource);
```

This creates/maintains another shared owner.

## Transfer an Existing Shared Owner

```cpp
process(std::move(resource));
```

This transfers the `shared_ptr` object into the parameter without incrementing the ownership count in the same way as copying.

## Borrow Only

If the function does not participate in ownership:

```cpp
void process(Resource& resource);
```

or nullable:

```cpp
void process(Resource* resource);
```

Usually do not use `shared_ptr` just because the object happens to be owned by one.

## Observe Without Owning

A function can accept:

```cpp
const std::shared_ptr<Resource>& resource
```

when it specifically needs to inspect/manipulate the smart pointer itself without creating another owner.

But if it only needs the `Resource`, prefer:

```cpp
const Resource& resource
```

## Rule of Thumb

```text
shared ownership needed -> shared_ptr<T>
non-owning reference     -> T&
nullable non-owner       -> T*
inspect smart pointer    -> const shared_ptr<T>&
```

## Interview Tip

Do not pass `shared_ptr` by value everywhere. It should communicate a meaningful ownership decision.
