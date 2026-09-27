# Member Access Specifiers

C++ provides:

```text
public
protected
private
```

## `public`

Accessible through the class's public interface.

```cpp
class Person
{
public:
    void speak();
};
```

## `protected`

Accessible inside the class and derived classes.

```cpp
class Person
{
protected:
    int age;
};
```

## `private`

Accessible only from the class and its friends.

```cpp
class Person
{
private:
    int id;
};
```

A derived class cannot directly access `id`.

## Default Access

For `class`:

```cpp
class Person
{
    int age; // private
};
```

For `struct`:

```cpp
struct Person
{
    int age; // public
};
```

## Important

A private base member still exists in the base subobject; it is simply not directly accessible from derived code.

## Interview Tip

```text
class  -> default private
struct -> default public
```
