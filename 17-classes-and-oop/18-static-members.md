# Static Data Members

A static data member belongs to the class rather than to individual objects.

```cpp
class Counter
{
public:
    inline static int count = 0;
};
```

There is one `count` shared by all `Counter` objects.

## Access

```cpp
Counter::count++;
```

No object is required to access a static data member.

## Pre-C++17 definition

Before inline variables, a non-const static data member typically required an out-of-class definition:

```cpp
class Counter
{
public:
    static int count;
};

int Counter::count = 0;
```

## C++17 inline static member

C++17 allows:

```cpp
class Counter
{
public:
    inline static int count = 0;
};
```

This can be defined directly inside the class definition.

## Per-object vs class-wide

```cpp
class Example
{
    int value = 0;               // one per object
    inline static int count = 0; // one per class
};
```

## Static members and object size

Static data members do not occupy storage inside each object.

## Shared state

```cpp
Counter a;
Counter b;

++Counter::count;
```

Both objects observe the same static member.

## Initialization

Static data members have static storage duration, and their initialization follows the rules for static storage objects.

For complex global/static state, initialization order across translation units can be an important design issue.

## Interview point

A static data member is associated with the class, not with a particular object.
