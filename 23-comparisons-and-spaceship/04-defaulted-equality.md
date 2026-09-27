# Defaulted Equality

C++20 allows equality comparison to be explicitly defaulted.

```cpp
struct Person
{
    std::string name;
    int age{};

    bool operator==(const Person&) const = default;
};
```

The compiler generates the comparison based on the class's members.

## Example

```cpp
Person a{"Alice", 30};
Person b{"Alice", 30};

bool same = (a == b);
```

The generated equality compares the corresponding members.

## Why Use It?

It avoids repetitive code:

```cpp
return name == other.name &&
       age == other.age;
```

when memberwise equality is exactly what the type needs.

## `!=`

C++20's comparison machinery provides support for inequality based on equality when appropriate, so you often do not need to manually write both operators.

## Member Requirements

Each compared member must itself support the required equality comparison.

For example:

```cpp
struct Data
{
    int value;
    std::string name;

    bool operator==(const Data&) const = default;
};
```

works because `int` and `std::string` support equality.

## When Not to Default

Do not default equality when logical equality differs from memberwise equality.

Example:

```text
internal cache state
timestamps
debug-only fields
```

may not belong in the definition of logical equality.

## Interview Tip

`= default` is useful when the compiler-generated memberwise semantics match the class's intended value semantics.
