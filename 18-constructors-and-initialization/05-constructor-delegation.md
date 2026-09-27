# Constructor Delegation

C++11 allows one constructor to call another constructor of the same class.

```cpp
class Person
{
public:
    Person()
        : Person("Unknown", 0)
    {
    }

    Person(std::string name, int age)
        : name(std::move(name)), age(age)
    {
    }

private:
    std::string name;
    int age;
};
```

## Benefits

- Avoids duplicated initialization logic.
- Centralizes construction.
- Makes constructor behavior easier to maintain.

## Rules

A delegating constructor uses another constructor in its initializer list:

```cpp
Person() : Person("Unknown", 0) {}
```

The target constructor performs the actual member initialization.

A constructor cannot delegate to more than one constructor.

## Important

Delegation happens before the body of the delegating constructor executes.

```cpp
Person() : Person("Unknown", 0)
{
    // runs after the target constructor
}
```
