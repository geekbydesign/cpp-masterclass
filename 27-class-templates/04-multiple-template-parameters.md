# Multiple Template Parameters

A class template can have multiple template parameters.

```cpp
template <typename Key, typename Value>
class Pair {
    Key key;
    Value value;

public:
    Pair(Key k, Value v)
        : key(k), value(v) {}
};
```

Usage:

```cpp
Pair<int, std::string> p(1, "One");
```

Parameters can mix types and values:

```cpp
template <typename T, typename Allocator, std::size_t N>
class Container {
};
```

## Parameter Order

Template arguments correspond to parameters by position unless deduction or other mechanisms determine them.

```cpp
Pair<int, double>
```

means:

```text
Key   = int
Value = double
```

## Design Tip

Keep template parameter lists understandable. If many parameters are required, consider defaults, traits, concepts, or a policy-based design.
