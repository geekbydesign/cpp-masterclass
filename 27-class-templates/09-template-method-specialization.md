# Template Method Specialization

A member function of a class template can have behavior specialized based on the class template parameters.

```cpp
template <typename T>
class Processor {
public:
    void process();
};

template <typename T>
void Processor<T>::process() {
    // generic implementation
}
```

A member function can also be specialized when the surrounding class template is explicitly specialized.

```cpp
template <>
void Processor<int>::process() {
    // int-specific behavior
}
```

## Important Distinction

Do not confuse:
- Full specialization of a class template.
- Specialization of a member of a class template.
- Overloading a member function template.

Each has different syntax and rules.

## Practical Guidance

If behavior can be expressed cleanly with overloads or `if constexpr`, those approaches are often easier to maintain than many explicit specializations.
