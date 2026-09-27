# Protected Members

`protected` members are accessible inside the class and its derived classes, but not directly from ordinary external code.

```cpp
class Person
{
protected:
    int age{};
};

class Employee : public Person
{
public:
    void setAge(int value)
    {
        age = value;
    }
};
```

```cpp
Employee e;
// e.age = 30; // error
```

## Access Levels

```text
private   -> class/friends
protected -> class/friends + derived classes
public    -> public interface
```

## Protected vs Private

```cpp
class Base
{
private:
    int privateValue;

protected:
    int protectedValue;
};
```

Derived code cannot directly access `privateValue`, but can access `protectedValue`.

## Design Note

`protected` exposes implementation details to subclasses. Private data with protected/public member functions often gives stronger encapsulation.

## Interview Tip

`protected` does not mean public; it specifically extends access to derived-class code.
