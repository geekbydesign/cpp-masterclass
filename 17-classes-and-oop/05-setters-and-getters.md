# Setters and Getters

Setters and getters provide controlled access to private data.

```cpp
class Person
{
private:
    int age = 0;

public:
    void setAge(int value)
    {
        age = value;
    }

    int getAge() const
    {
        return age;
    }
};
```

## Why use them?

They can enforce invariants:

```cpp
void setAge(int value)
{
    if (value >= 0)
        age = value;
}
```

## Const getter

A getter that does not modify the object should normally be `const`:

```cpp
int getAge() const;
```

This allows it to be called on const objects.

## Returning references

For larger objects, a getter may return a const reference:

```cpp
const std::string& getName() const
{
    return name;
}
```

This avoids a copy but exposes a reference whose lifetime is tied to the object.

## Avoid unnecessary getters/setters

Encapsulation is not simply making every data member private and automatically generating a getter/setter.

The interface should expose meaningful operations and preserve class invariants.

## Interview point

A good class controls how its state can change rather than exposing internal representation unnecessarily.
