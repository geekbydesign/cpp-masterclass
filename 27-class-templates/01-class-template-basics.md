# Class Template Basics

A class template defines a family of classes parameterized by types or values.

```cpp
template <typename T>
class Box {
    T value;

public:
    Box(T v) : value(v) {}

    T get() const {
        return value;
    }
};
```

## Using the Template

```cpp
Box<int> a(10);
Box<std::string> b("Hello");
```

The compiler generates the required specialization when it is needed.

## `typename` vs `class`

Both are valid for a type template parameter:

```cpp
template <typename T>
class Box;
```

```cpp
template <class T>
class Box;
```

For template type parameters, they are equivalent.

## Key Point

```text
Class template → blueprint
Class template specialization → actual type
Object → instance of that type
```
