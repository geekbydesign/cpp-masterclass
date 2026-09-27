# Projections

A projection lets a range algorithm operate on a transformed property of an element without explicitly creating a transformed range.

Example:

```cpp
struct Person {
    std::string name;
    int age;
};

std::vector<Person> people;
```

Sort by age:

```cpp
std::ranges::sort(
    people,
    {},
    &Person::age
);
```

The projection is:

```cpp
&Person::age
```

## Why Projections?

Without a projection, older code may use a comparator that extracts the desired property:

```cpp
std::sort(
    people.begin(),
    people.end(),
    [](const Person& a, const Person& b) {
        return a.age < b.age;
    }
);
```

Ranges algorithms can separate:

```text
what to compare
+
what property to inspect
```

## General Form

Many range algorithms accept:

```text
range
predicate/comparator
projection
```

## Important

A projection is not necessarily a materialized transformation. It is a callable used by the algorithm when examining elements.
