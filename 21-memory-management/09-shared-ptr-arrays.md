# `shared_ptr` Arrays

A `shared_ptr` can manage dynamically allocated arrays.

```cpp
auto values = std::shared_ptr<int[]>(
    new int[10]
);
```

Modern C++ also supports:

```cpp
auto values = std::make_shared<int[]>(10);
```

## Access

```cpp
values[0] = 42;
```

## Lifetime

Multiple `shared_ptr` objects can share ownership of the array:

```cpp
auto a = std::make_shared<int[]>(10);
auto b = a;
```

The array is destroyed when the final owning `shared_ptr` is gone.

## Prefer Containers When Appropriate

Usually:

```cpp
std::vector<int>
```

is a better choice when you need a dynamic collection.

For fixed-size storage:

```cpp
std::array<int, 10>
```

may be appropriate.

## When Useful

`shared_ptr<T[]>` can be useful when:

- dynamic array ownership must be shared
- array lifetime must extend across multiple owners
- a container is not appropriate for the interface

## Interview Tip

Use shared ownership only when there is a real ownership requirement; otherwise prefer value types or `unique_ptr`.
