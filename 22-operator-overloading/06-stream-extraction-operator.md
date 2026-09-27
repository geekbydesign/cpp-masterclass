# Stream Extraction Operator

The stream extraction operator is:

```cpp
operator>>
```

It is commonly overloaded to support:

```cpp
std::cin >> object;
```

## Example

```cpp
class Person
{
public:
    std::string name;
    int age{};

    friend std::istream& operator>>(
        std::istream& is,
        Person& person)
    {
        is >> person.name >> person.age;
        return is;
    }
};
```

Usage:

```cpp
Person p;

std::cin >> p;
```

## Why Return `std::istream&`?

It allows chaining:

```cpp
std::cin >> p1 >> p2;
```

## Why Is the Object Non-Const?

Extraction modifies the object:

```cpp
Person& person
```

not:

```cpp
const Person&
```

## Error Handling

Stream state represents input status:

```cpp
if (std::cin >> p)
{
    // success
}
```

A custom extraction operator should leave the stream in an appropriate state when parsing fails.

## Signature Pattern

```cpp
std::istream& operator>>(
    std::istream& is,
    T& object);
```

## Interview Tip

Insertion:

```text
object -> stream
```

Extraction:

```text
stream -> object
```
