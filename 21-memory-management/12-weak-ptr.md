# `std::weak_ptr`

`std::weak_ptr` is a **non-owning observer** of an object managed by `shared_ptr`.

It does not increase the strong ownership count.

```cpp
auto shared = std::make_shared<int>(42);

std::weak_ptr<int> weak = shared;
```

## Why?

The main use cases are:

- breaking `shared_ptr` cycles
- observing an object without extending its lifetime

## `lock()`

Before accessing the object:

```cpp
if (auto shared = weak.lock())
{
    std::cout << *shared;
}
```

`lock()` returns:

```text
shared_ptr -> object exists
empty      -> object already destroyed
```

## Example Cycle

Bad design:

```text
A --shared_ptr--> B
B --shared_ptr--> A
```

The objects can keep each other alive.

Better:

```text
A --shared_ptr--> B
B --weak_ptr---> A
```

Now B does not own A.

## `expired()`

```cpp
if (weak.expired())
{
    // managed object no longer exists
}
```

Usually `lock()` is safer because it obtains a temporary owning `shared_ptr` if the object is still alive.

## Important

A `weak_ptr` cannot be dereferenced directly:

```cpp
*weak; // invalid
```

Use `lock()`.

## Interview Tip

Think:

```text
shared_ptr -> owns
weak_ptr   -> observes
```
