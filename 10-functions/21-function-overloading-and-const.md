# Function Overloading and `const`

For member functions, `const` qualification is part of the function type/overload set:

```cpp
class Test
{
public:
    void print();
    void print() const;
};
```

A non-const object can call the non-const overload when viable:

```cpp
Test t;
t.print();
```

A const object requires the const overload:

```cpp
const Test t;
t.print();
```

For by-value parameters:

```cpp
void f(int);
void f(const int); // same parameter type for overloading
```

This is **not** a valid overload pair.

**Interview:** Member-function `const` and top-level parameter `const` are different concepts.
