# Stream Insertion Operator

The stream insertion operator is:

```cpp
operator<<
```

It is commonly overloaded to support:

```cpp
std::cout << object;
```

## Typical Implementation

```cpp
class Person
{
public:
    std::string name;
    int age{};

    friend std::ostream& operator<<(
        std::ostream& os,
        const Person& person)
    {
        os << person.name << ' ' << person.age;
        return os;
    }
};
```

Usage:

```cpp
Person p{"Alice", 30};

std::cout << p;
```

## Why Return `std::ostream&`?

Returning the stream enables chaining:

```cpp
std::cout << p << '\n';
```

## Why Usually Non-Member?

The left operand is the stream:

```cpp
std::cout << p;
```

The stream is a standard-library type, so the overload is commonly implemented as a non-member function.

## `friend`

A friend implementation can access private members directly.

Alternatively, public getters can be used.

## Important

Do not modify the object just because it is being printed.

The object parameter is normally:

```cpp
const Person&
```

## Interview Tip

Remember the signature pattern:

```cpp
std::ostream& operator<<(
    std::ostream& os,
    const T& object);
```
