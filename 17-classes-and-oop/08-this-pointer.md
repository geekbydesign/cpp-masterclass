# `this` Pointer

Inside a non-static member function, `this` points to the current object.

```cpp
class Counter
{
    int value = 0;

public:
    void setValue(int value)
    {
        this->value = value;
    }
};
```

Here:

```cpp
this->value
```

refers to the member, while:

```cpp
value
```

refers to the parameter.

## Type of `this`

For a non-const member function:

```cpp
this
```

is conceptually a pointer to the current object.

In a const member function, the pointed-to object is const.

## Returning `*this`

Useful for method chaining:

```cpp
class Builder
{
public:
    Builder& setValue(int value)
    {
        this->value = value;
        return *this;
    }

private:
    int value = 0;
};
```

Then:

```cpp
Builder b;

b.setValue(10)
 .setValue(20);
```

## `this` cannot be used in static member functions

Static member functions have no current object, so they do not have a `this` pointer.

## `this` and lambdas

Inside a member function:

```cpp
auto f = [this]()
{
    value++;
};
```

captures the current object's pointer.

## Interview point

`this` is available in non-static member functions and represents the current object. It is not available in static member functions.
