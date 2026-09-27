# Polymorphic Objects in Containers

Storing polymorphic objects directly by value in a container can cause slicing.

```cpp
std::vector<Base> objects;
objects.push_back(Derived{}); // slices
```

## Prefer Indirection

### Raw pointers

```cpp
std::vector<Base*> objects;
```

Ownership must be managed separately.

### `std::unique_ptr`

Usually the preferred ownership model:

```cpp
std::vector<std::unique_ptr<Base>> objects;

objects.push_back(std::make_unique<Derived>());
objects[0]->show();
```

## Why `unique_ptr`?
- Preserves dynamic type.
- Clearly expresses ownership.
- Automatically destroys objects.
- Avoids manual `delete`.

## Interview Tip
For an owning polymorphic container, think:

```text
vector<unique_ptr<Base>>
```

rather than:

```text
vector<Base>
```
