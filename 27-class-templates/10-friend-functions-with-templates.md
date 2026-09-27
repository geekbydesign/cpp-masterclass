# Friend Functions with Class Templates

A class template can declare a non-member function as a friend.

```cpp
template <typename T>
class Box {
    T value;

public:
    Box(T v) : value(v) {}

    friend void print(const Box& b) {
        std::cout << b.value;
    }
};
```

The friend function can access private members.

## Important

A friend function defined inside a class template is instantiated for the relevant specialization.

```cpp
Box<int> a(10);
Box<double> b(3.14);
```

The generated friend functions are associated with their corresponding specializations.

## Common Use

This pattern is frequently used for:
- Stream operators.
- Comparison operators.
- Helper functions needing private access.

Be careful with naming and multiple instantiations to avoid unintended redefinition issues.
