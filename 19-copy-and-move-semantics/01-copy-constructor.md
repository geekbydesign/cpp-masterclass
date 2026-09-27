# Copy Constructor

A copy constructor creates a new object from an existing object of the same type.

```cpp
class Person
{
public:
    Person(const Person& other)
        : name(other.name), age(other.age)
    {
    }

private:
    std::string name;
    int age{};
};
```

## Typical Signature

```cpp
T(const T& other);
```

## Example

```cpp
Person p1{"Alice", 30};
Person p2 = p1;
Person p3(p1);
```

`p2` and `p3` are copy-constructed.

## When It Can Be Called

```cpp
T b = a;
T b(a);
```

Also when passing or returning objects by value, although copy elision may remove the actual copy.

## Compiler-Generated Copy Constructor

If not declared, the compiler may generate one.

It performs memberwise copy:

```cpp
struct Point
{
    int x;
    int y;
};
```

Copying `Point` copies `x` and `y`.

## Copy Constructor vs Copy Assignment

```cpp
T b = a; // construction -> copy constructor

T b;
b = a;   // assignment -> copy assignment operator
```

## Interview Tip

A copy constructor initializes a **new object**. Copy assignment modifies an **existing object**.
