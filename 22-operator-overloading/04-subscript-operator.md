# Subscript Operator

The subscript operator `[]` can be overloaded to provide indexed access.

```cpp
class Array
{
public:
    int& operator[](std::size_t index)
    {
        return data[index];
    }

    const int& operator[](std::size_t index) const
    {
        return data[index];
    }

private:
    int data[10]{};
};
```

Usage:

```cpp
Array a;

a[0] = 42;
std::cout << a[0];
```

## Why Return a Reference?

Returning `int&` allows modification:

```cpp
a[0] = 100;
```

## Const Overload

For a const object:

```cpp
const Array a{};

std::cout << a[0];
```

the `const` overload is selected.

## Bounds Checking

A subscript operator traditionally does not have to perform bounds checking.

For checked access, a type may also provide:

```cpp
at(index);
```

similar to standard containers.

## C++23 Note

C++23 allows a multidimensional `operator[]` parameter list, making forms such as:

```cpp
matrix[i, j]
```

possible when the type defines the appropriate operator.

## Interview Tip

A common pattern is:

```cpp
T& operator[](size_t);
const T& operator[](size_t) const;
```

for mutable and const access.
