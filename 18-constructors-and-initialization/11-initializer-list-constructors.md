# Initializer-List Constructors

## `std::initializer_list`

A constructor can accept brace-initialized values using `std::initializer_list`.

```cpp
#include <initializer_list>

class Numbers
{
public:
    Numbers(std::initializer_list<int> values)
    {
        for (int value : values)
        {
            // process value
        }
    }
};

Numbers n{1, 2, 3, 4};
```

## Common Use

Standard containers support this style:

```cpp
std::vector<int> values{1, 2, 3, 4};
```

## Constructor Selection

Initializer-list constructors have special preference during list initialization.

```cpp
class Example
{
public:
    Example(int, int);
    Example(std::initializer_list<int>);
};

Example e{1, 2}; // initializer_list constructor is preferred
```

This can sometimes produce surprising overload resolution.

## Important

Do not confuse:

- **member initializer list**: `: member(value)`
- **`std::initializer_list` constructor**: constructor accepting `{...}` values

They are completely different concepts.

## Interview Tip

The member initializer list initializes members; `std::initializer_list` represents a list of values passed to a function/constructor.
