# Deleted Constructors

C++ allows explicitly disabling constructors using `= delete`.

```cpp
class Database
{
public:
    Database() = delete;
    explicit Database(int id) {}
};
```

Now:

```cpp
Database db; // error
Database db2(10); // OK
```

## Delete Copying

A type can be made non-copyable:

```cpp
class Resource
{
public:
    Resource() = default;

    Resource(const Resource&) = delete;
    Resource& operator=(const Resource&) = delete;
};
```

## Delete Specific Constructor Overloads

```cpp
class Example
{
public:
    Example(int);
    Example(double) = delete;
};
```

This prevents unwanted conversions through the deleted overload.

## Why Use `= delete`?

- Make ownership types non-copyable.
- Prevent invalid construction.
- Make API restrictions explicit.
- Produce clear compile-time errors.

## Interview Tip

`= delete` is preferable to relying on private constructors or undefined functions when the intent is to explicitly prohibit an operation.
