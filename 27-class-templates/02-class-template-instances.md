# Class Template Instances

A class template becomes a concrete class when template arguments are supplied.

```cpp
template <typename T>
class Storage {
public:
    T value;
};

Storage<int> a;
Storage<double> b;
```

`Storage<int>` and `Storage<double>` are different types.

## Multiple Objects

```cpp
Storage<int> x;
Storage<int> y;
```

Both objects have the same specialization type: `Storage<int>`.

## Template Argument Deduction

For class templates, C++17 supports **Class Template Argument Deduction (CTAD)** when the compiler can deduce the template arguments.

```cpp
template <typename T>
class Box {
public:
    Box(T value) : value(value) {}

private:
    T value;
};

Box box(10); // Box<int>
```

## Important

Function templates commonly deduce template arguments from function calls. Class templates traditionally require explicit arguments, although CTAD can deduce them in supported cases.
