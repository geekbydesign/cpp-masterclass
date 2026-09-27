# Move Semantics and Pointers

Move semantics become especially useful when a class owns dynamically allocated resources.

## Expensive Copy

```cpp
class Buffer
{
    int* data;
};
```

A deep copy may require:

```text
allocate memory
copy elements
```

## Move

A move can transfer the pointer:

```cpp
Buffer(Buffer&& other) noexcept
    : data(other.data)
{
    other.data = nullptr;
}
```

The actual resource is not copied.

## Ownership Transfer

```text
Before:

source ─────> resource
destination

After move:

source ──> nullptr
destination ─────> resource
```

## Critical Rule

Only one object should be responsible for deleting the resource.

Otherwise:

```text
source ──┐
         ├──> same resource
dest   ──┘
```

can result in double deletion.

## Prefer RAII

Instead of manually managing raw pointers:

```cpp
std::unique_ptr<int> data;
std::vector<int> data;
std::string data;
```

These types already implement appropriate ownership and move semantics.

## Interview Tip

Move semantics are fundamentally about **transferring ownership/resources efficiently**, not about copying pointers without understanding ownership.
