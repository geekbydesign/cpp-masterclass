# Copy Constructors

## Definition

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
    int age;
};
```

Typical signature:

```cpp
T(const T&);
```

## Example

```cpp
Person p1("Alice", 30);
Person p2 = p1;
```

`p2` is constructed using the copy constructor.

## When Is It Used?

Common cases:

```cpp
Person b = a;
Person b(a);
return a;
void f(Person p); // parameter passed by value
```

Some cases may be optimized using copy elision.

## Compiler-Generated Copy Constructor

If you do not declare one, the compiler may generate one automatically.

It performs memberwise copy.

## Important Distinction

Copy construction:

```cpp
Person b = a;
```

Copy assignment:

```cpp
b = a;
```

They are different operations.

## Interview Tip

A copy constructor constructs a **new object**. Assignment operates on an **already existing object**.
