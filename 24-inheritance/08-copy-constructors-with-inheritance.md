# Copy Constructors with Inheritance

Copying a derived object copies its base subobject and then its derived members.

```cpp
class Person
{
public:
    Person(const Person&) = default;
};

class Engineer : public Person
{
public:
    Engineer(const Engineer&) = default;
};
```

Conceptually:

```text
Engineer copy
    ↓
copy Person base subobject
    ↓
copy Engineer members
```

## Same Derived Type

```cpp
Engineer e1;
Engineer e2 = e1;
```

No slicing occurs because the destination is also `Engineer`.

## Copying Into a Base

```cpp
Person p = e1;
```

Only the `Person` portion is copied. This is **object slicing**.

## Copy Assignment

The same principle applies:

```cpp
Engineer e2;
e2 = e1;
```

The base subobject and derived members are assigned appropriately.

## Interview Tip

Derived copy construction copies the base subobject; copying a derived object into a base object by value causes slicing.
