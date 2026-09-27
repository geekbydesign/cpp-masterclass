# `typeid`

`typeid` obtains type information at runtime or compile time depending on the expression.

```cpp
Base* p = new Derived;

std::cout << typeid(*p).name();
```

For a polymorphic type, applying `typeid` to a dereferenced pointer/reference gives the **dynamic type**.

```cpp
typeid(*p) == typeid(Derived); // true
```

For a non-polymorphic base, the static type is used.

## Important
`typeid(pointer)` reports the pointer's type, not the pointed-to object's dynamic type.

```cpp
typeid(p);   // type of Base*
typeid(*p);  // dynamic type if Base is polymorphic
```

The exact string returned by `name()` is implementation-dependent.
