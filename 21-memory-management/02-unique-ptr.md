# `std::unique_ptr`

`std::unique_ptr` represents **exclusive ownership** of a dynamically allocated object.

```cpp
#include <memory>

std::unique_ptr<int> ptr = std::make_unique<int>(42);
```

When `ptr` is destroyed, the owned object is automatically destroyed.

## No Copy

```cpp
auto p1 = std::make_unique<int>(42);

// auto p2 = p1; // error
```

Copying is disabled because ownership is unique.

## Move Ownership

```cpp
auto p2 = std::move(p1);
```

Now:

```text
p1 -> empty/valid moved-from state
p2 -> resource
```

## Access

```cpp
std::cout << *ptr;
std::cout << ptr.get();
```

`get()` returns the raw pointer without transferring ownership.

## Custom Deleter

```cpp
std::unique_ptr<FILE, decltype(&fclose)>
file(fopen("data.txt", "r"), &fclose);
```

## Prefer `make_unique`

```cpp
auto ptr = std::make_unique<MyClass>(args);
```

Advantages include clearer ownership and safer construction.

## Interview Tip

Use `unique_ptr` when there should be **one owner**.
