# Inheritance Hierarchies

An inheritance hierarchy contains multiple related base and derived types.

```cpp
class Person
{
public:
    virtual ~Person() = default;
};

class Engineer : public Person
{
};

class CivilEngineer : public Engineer
{
};
```

Hierarchy:

```text
Person
  |
Engineer
  |
CivilEngineer
```

## Construction

Creating:

```cpp
CivilEngineer c;
```

constructs:

```text
Person
  ↓
Engineer
  ↓
CivilEngineer
```

## Direct vs Indirect Base

For:

```cpp
class CivilEngineer : public Engineer {};
```

`Engineer` is the direct base.

`Person` is an indirect base.

The `CivilEngineer` constructor directly initializes `Engineer`; `Engineer` initializes `Person`.

## Multiple Inheritance

C++ also supports:

```cpp
class Printable {};
class Serializable {};

class Document : public Printable, public Serializable {};
```

A class can have multiple base subobjects.

## Common Interview Topics

Be prepared for:

```text
base/derived construction order
base/derived destruction order
access control
function hiding
overriding
virtual destructors
copying derived objects
object slicing
multiple inheritance
```

## Design Considerations

Deep hierarchies can increase coupling and maintenance complexity. Use inheritance when the type relationship is meaningful.

## Interview Tip

Each constructor initializes its direct bases and its own members; each destructor cleans up its own level before the base destructors run.
