# `const`

`const` means that an object is not modifiable through the particular `const`-qualified access.

## 1. Basic `const`

```cpp
const int maxUsers = 100;
```

This object cannot be modified:

```cpp
// maxUsers = 200; // error
```

A `const` object normally must be initialized.

```cpp
const int value = 10;
```

## 2. `const` With Pointers

These three forms are important.

### Pointer to const

```cpp
const int* ptr;
```

or:

```cpp
int const* ptr;
```

The pointed-to integer cannot be modified through `ptr`.

```cpp
int value = 10;
const int* ptr = &value;

// *ptr = 20; // error
value = 20;   // okay
```

### Const pointer

```cpp
int* const ptr = &value;
```

The pointer itself cannot point somewhere else.

```cpp
*ptr = 20; // okay
// ptr = &other; // error
```

### Const pointer to const

```cpp
const int* const ptr = &value;
```

Neither the pointer nor the pointed-to value can be modified through `ptr`.

## 3. `const` References

```cpp
const int& ref = value;
```

You cannot modify `value` through `ref`.

```cpp
// ref = 20; // error
```

A `const` reference can bind to a temporary:

```cpp
const int& ref = 42;
```

The temporary's lifetime is extended in this initialization context.

## 4. Function Parameters

Prefer `const` when a function should not modify an object.

```cpp
void print(const std::string& text)
{
    std::cout << text;
}
```

This avoids an unnecessary copy while preventing modification through the parameter.

## 5. `const` Member Functions

```cpp
class User
{
public:
    int getId() const
    {
        return id;
    }

private:
    int id{};
};
```

A `const` member function promises not to modify the object's non-`mutable` state through the implicit object parameter.

## 6. `mutable`

A `mutable` data member can be modified even from a `const` member function.

```cpp
class Counter
{
public:
    int get() const
    {
        ++accessCount;
        return value;
    }

private:
    int value{};
    mutable int accessCount{};
};
```

Use this deliberately; `mutable` does not make the entire object non-const.

## 7. Top-Level vs Low-Level Const

Consider:

```cpp
const int* ptr;
```

The `const` applies to the pointed-to object.

For:

```cpp
int* const ptr = &value;
```

the pointer itself is const.

This distinction becomes important in type deduction and function overloads.

## 8. `const` and `auto`

```cpp
const int x = 10;

auto a = x;        // int
const auto b = x;  // const int
const auto& c = x; // const int&
```

`auto` by value normally does not retain top-level `const`.

## Quick Revision

```text
const int*       → pointer to const
int* const       → const pointer
const int* const → const pointer to const
```

## Interview Points

- `const` is a type qualifier.
- `const` prevents modification through that access path.
- `const` references are commonly used for read-only function parameters.
- A `const` member function cannot normally modify non-`mutable` members.
- Top-level and low-level `const` are different concepts.
