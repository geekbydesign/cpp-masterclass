# Converting `unique_ptr` to `shared_ptr`

A `unique_ptr` can be transferred into a `shared_ptr`.

```cpp
std::unique_ptr<Resource> unique =
    std::make_unique<Resource>();

std::shared_ptr<Resource> shared =
    std::move(unique);
```

Ownership is transferred.

## Before

```text
unique -> Resource
```

## After

```text
unique -> empty/valid moved-from state
shared -> Resource
```

## Why Convert?

You may start with unique ownership:

```cpp
auto resource = std::make_unique<Resource>();
```

and later pass it into an API that requires shared ownership.

## Important

There is no general reason to convert `shared_ptr` back to `unique_ptr`.

Once multiple owners may exist, unique ownership cannot safely be assumed.

## Design Principle

Start with the least powerful ownership model that satisfies the design.

```text
unique ownership
       |
       v
shared ownership only when needed
```

## Interview Tip

Moving a `unique_ptr` into a `shared_ptr` transfers ownership; it does not copy the managed object.
