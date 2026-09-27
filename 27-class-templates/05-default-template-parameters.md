# Default Template Parameters

Template parameters can have default arguments.

```cpp
template <typename T = int>
class Box {
public:
    T value;
};
```

Now both are valid:

```cpp
Box<> a;       // Box<int>
Box<double> b; // Box<double>
```

## Multiple Defaults

```cpp
template <
    typename T = int,
    typename Allocator = std::allocator<T>
>
class Container {
};
```

Defaults can reduce repetitive template arguments.

## Rules

Once a template parameter has a default, following parameters generally need defaults as well, with rules depending on the template context.

For example:

```cpp
template <typename T = int, typename U = double>
class Pair;
```

## Key Point

Default template arguments improve usability while preserving customization.
