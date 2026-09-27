# Static Member Functions

A static member function belongs to the class rather than a particular object.

```cpp
class Math
{
public:
    static int square(int x)
    {
        return x * x;
    }
};
```

Call it using the class:

```cpp
int result = Math::square(5);
```

## No `this` pointer

A static member function has no current object, so it does not have a `this` pointer.

Therefore it cannot directly access non-static members:

```cpp
class Example
{
    int value;

public:
    static void process()
    {
        // value = 10; // Error
    }
};
```

## It can access static members

```cpp
class Counter
{
    inline static int count = 0;

public:
    static void increment()
    {
        ++count;
    }
};
```

## Can be called through an object

Although possible in some contexts:

```cpp
Counter c;
c.increment();
```

the function is still static and does not operate on `c`.

Prefer:

```cpp
Counter::increment();
```

when expressing class-level behavior.

## Common uses

- utility operations related to a class
- factory functions
- operations involving only static state
- class-level configuration

## Static function vs free function

A static member function can express that the operation is conceptually associated with a class and can access its private static members.

## Interview point

Remember:

```text
static member function
→ no this pointer
→ cannot directly access non-static members
→ can access static members
```
