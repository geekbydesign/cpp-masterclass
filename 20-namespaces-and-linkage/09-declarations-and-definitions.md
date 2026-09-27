# Declarations and Definitions

A **declaration** tells the compiler that a name and its type exist.

```cpp
int add(int, int);
```

A **definition** provides the entity's actual implementation or storage.

```cpp
int add(int a, int b)
{
    return a + b;
}
```

## Variable Example

```cpp
extern int count; // declaration, no storage definition here
```

Definition:

```cpp
int count = 10;
```

## Class Example

A class definition defines the class type:

```cpp
class Person
{
public:
    void print();
};
```

Member function definition:

```cpp
void Person::print()
{
}
```

## Why Separate Them?

Headers commonly contain declarations:

```cpp
// math.h
int add(int, int);
```

Source files contain definitions:

```cpp
// math.cpp
int add(int a, int b)
{
    return a + b;
}
```

This allows multiple translation units to use the same interface.

## Important

A declaration is not automatically a definition, and a definition is also a declaration.

## Interview Tip

A useful mental model:

```text
declaration = "this exists"
definition  = "this is what it is / how it works"
```
