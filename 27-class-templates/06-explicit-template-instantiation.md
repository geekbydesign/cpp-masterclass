# Explicit Template Instantiation

Normally, the compiler instantiates a template when a required specialization is used.

Explicit instantiation can request a specific specialization directly.

```cpp
template <typename T>
class Box {
public:
    void print();
};

template <typename T>
void Box<T>::print() {
}
```

Explicit instantiation:

```cpp
template class Box<int>;
```

This asks the compiler to instantiate `Box<int>`.

## Why Use It?

Useful when:
- Controlling where template code is instantiated.
- Reducing repeated compilation work.
- Separating template implementation from headers in controlled designs.

## `extern template`

```cpp
extern template class Box<int>;
```

This can suppress implicit instantiation in a translation unit when an explicit instantiation is provided elsewhere.

## Interview Point

Templates usually need definitions visible where implicit instantiation occurs. Explicit instantiation is one technique for managing this.
