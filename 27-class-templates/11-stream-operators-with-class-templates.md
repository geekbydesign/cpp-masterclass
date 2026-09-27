# Stream Operators with Class Templates

Class templates commonly overload `operator<<` and `operator>>`.

```cpp
template <typename T>
class Box {
    T value;

public:
    Box(T v) : value(v) {}

    friend std::ostream& operator<<(
        std::ostream& os,
        const Box& box)
    {
        return os << box.value;
    }
};
```

Usage:

```cpp
Box<int> b(42);
std::cout << b;
```

## Why Return `std::ostream&`?

Returning the stream enables chaining:

```cpp
std::cout << b1 << b2;
```

## Extraction Example

```cpp
template <typename T>
std::istream& operator>>(std::istream& is, Box<T>& box);
```

The operator is generally a non-member because the stream object is the left operand.

## Interview Tip

Remember the common signature pattern:

```cpp
std::ostream& operator<<(std::ostream&, const T&);
```
