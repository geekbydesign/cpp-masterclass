# Copying Objects in Arrays

Objects stored in arrays are copied or constructed according to normal object-initialization rules.

```cpp
class Item
{
public:
    Item(int value) : value(value) {}
    Item(const Item&) = default;

private:
    int value;
};

Item a(10);
Item items[] = {a, a};
```

Each array element is a separate object.

## Copying an Array of Objects

For a C-style array:

```cpp
Item source[2] = {Item(1), Item(2)};
Item destination[2] = {source[0], source[1]};
```

Each destination element is copy-constructed.

## Important

Arrays are not assignable as a whole:

```cpp
destination = source; // error
```

For arrays of class objects, each object has its own lifetime and storage.

## `std::array`

```cpp
std::array<Item, 2> a;
std::array<Item, 2> b = a;
```

`std::array` supports normal copy assignment and copy construction.

## Interview Tip

Remember the distinction between **copying each object** and **copying the array object itself**.
