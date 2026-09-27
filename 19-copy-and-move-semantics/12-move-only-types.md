# Move-Only Types

A move-only type can be moved but cannot be copied.

A common example is:

```cpp
std::unique_ptr<int>
```

```cpp
std::unique_ptr<int> p1 = std::make_unique<int>(42);

auto p2 = std::move(p1);
```

But:

```cpp
auto p2 = p1; // error
```

## Why Move-Only?

Unique ownership should not be duplicated.

```text
p1 -> resource

move

p1 -> empty/valid moved-from state
p2 -> resource
```

## Creating a Move-Only Class

```cpp
class Resource
{
public:
    Resource() = default;

    Resource(const Resource&) = delete;
    Resource& operator=(const Resource&) = delete;

    Resource(Resource&&) noexcept = default;
    Resource& operator=(Resource&&) noexcept = default;
};
```

## Common Move-Only Types

- `std::unique_ptr`
- `std::thread`
- many ownership/resource wrapper types

## Containers

Move-only objects can be stored in standard containers:

```cpp
std::vector<std::unique_ptr<int>> values;
values.push_back(std::make_unique<int>(10));
```

## Interview Tip

Move-only semantics are commonly used to represent **exclusive ownership**.
