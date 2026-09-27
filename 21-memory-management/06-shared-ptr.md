# `std::shared_ptr`

`std::shared_ptr` represents **shared ownership**.

Multiple `shared_ptr` objects can own the same resource.

```cpp
auto p1 = std::make_shared<int>(42);
auto p2 = p1;
```

Now both share ownership.

## Lifetime

The managed object is destroyed when the last owning `shared_ptr` is destroyed or reset.

```text
p1 ──┐
     ├──> object
p2 ──┘

p1 reset
     |
     v
p2 ───> object

p2 reset
     |
     v
object destroyed
```

## Reference Count

```cpp
std::cout << p1.use_count();
```

The count represents the number of shared owners, subject to the usual control-block semantics.

## Move

```cpp
auto p2 = std::move(p1);
```

Ownership is transferred from one `shared_ptr` object to another without adding another owner.

## Prefer `make_shared`

```cpp
auto ptr = std::make_shared<MyClass>(args);
```

It is generally preferred over manually constructing a `shared_ptr` from `new`.

## Cost

Compared with `unique_ptr`, `shared_ptr` typically has:

- control-block overhead
- reference-count operations
- more complicated ownership semantics

## Interview Tip

Use `shared_ptr` only when ownership is genuinely shared.
