# Smart Pointers

C++11 introduced the modern smart-pointer ownership tools:

- `std::unique_ptr`
- `std::shared_ptr`
- `std::weak_ptr`

They support RAII-based resource management.

## `unique_ptr`

Represents exclusive ownership.

```cpp
#include <memory>

auto p = std::make_unique<int>(42);
```

Only one `unique_ptr` owns the object.

```cpp
auto p2 = std::move(p);
```

After the move, `p` no longer owns the object.

## `shared_ptr`

Represents shared ownership.

```cpp
auto p1 = std::make_shared<int>(42);
auto p2 = p1;
```

Both share ownership.

The object is destroyed when the last owning `shared_ptr` is destroyed.

## `weak_ptr`

Provides a non-owning reference to an object managed by `shared_ptr`.

```cpp
std::weak_ptr<int> weak = p1;
```

Use:

```cpp
if (auto locked = weak.lock())
{
    std::cout << *locked;
}
```

## Prefer Factory Functions

```cpp
auto p = std::make_unique<MyClass>();
auto p = std::make_shared<MyClass>();
```

Benefits include clearer ownership and safer construction.

## Avoid Raw `new`/`delete`

Prefer:

```cpp
auto p = std::make_unique<MyClass>();
```

over:

```cpp
MyClass* p = new MyClass;
// ...
delete p;
```

## Ownership Summary

```text
unique_ptr → exclusive ownership
shared_ptr → shared ownership
weak_ptr   → non-owning observation
```

## Important

Smart pointers manage object lifetime; they do not automatically make the object thread-safe.

## Interview Point

Prefer `unique_ptr` by default when ownership is exclusive. Use `shared_ptr` only when shared ownership is actually required.
