# Custom Spaceship Operator

A class can implement its own `operator<=>` when memberwise comparison is not sufficient.

```cpp
#include <compare>

class Person
{
public:
    int age{};
    std::string name;

    std::strong_ordering operator<=>(const Person& other) const
    {
        if (auto result = age <=> other.age;
            result != 0)
        {
            return result;
        }

        return name <=> other.name;
    }
};
```

The comparison first uses age and then name.

## Why Custom?

Custom comparison is useful when:

- only selected members determine ordering
- ordering uses a specific priority
- fields require transformation
- comparison is not simple memberwise ordering

## Returning a Comparison Category

Common return types:

```cpp
std::strong_ordering
std::weak_ordering
std::partial_ordering
```

Example:

```cpp
std::strong_ordering operator<=>(const Person&) const;
```

## `compare_three_way`

The comparison expression:

```cpp
a <=> b
```

produces an ordering result.

You can compare it with zero:

```cpp
if ((a <=> b) < 0)
{
}
```

or use the named category constants:

```cpp
std::strong_ordering::less
std::strong_ordering::equal
std::strong_ordering::greater
```

## Interview Tip

Use defaulted `<=>` when memberwise ordering is correct. Write a custom `<=>` when the type has domain-specific ordering rules.
