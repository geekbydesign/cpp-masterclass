# Class Templates as Modules

Templates can be declared and exported from a module.

```cpp
export module containers;

export template <typename T>
class Box {
public:
    Box(T value) : value(value) {}

    T get() const {
        return value;
    }

private:
    T value;
};
```

A consumer can import the module:

```cpp
import containers;

Box<int> b(42);
```

## Why This Matters

Traditional template code is commonly placed in headers because template definitions generally need to be visible where implicit instantiation occurs.

Modules provide a language-level mechanism for making template declarations/definitions part of a module interface.

## Important

Modules do not eliminate the need to understand template instantiation rules.

The compiler still needs the appropriate template definition/reachable information to instantiate:

```cpp
Box<int>
```

## Best Practice

Keep exported template interfaces clean and avoid exporting unnecessary implementation details.
