# `std::move`

`std::move` is used to cast an expression to an xvalue so that move operations can be selected.

```cpp
std::string a = "hello";
std::string b = std::move(a);
```

## Important

`std::move` does **not** move anything by itself.

Conceptually, it says:

```text
Treat this object as an object whose resources may be transferred.
```

The actual move occurs when a move constructor or move assignment operator is selected.

## Example

```cpp
void process(std::string&& value);

std::string s = "hello";

process(s);            // error
process(std::move(s)); // OK
```

## After `std::move`

The source object remains valid but its state may be unspecified.

```cpp
std::string s = "hello";
std::string t = std::move(s);

// s is valid, but do not assume its old value
```

## Header

```cpp
#include <utility>
```

## Warning

Do not blindly use `std::move` on every variable.

Moving from an object means you are giving up assumptions about its current value.

## Interview Tip

Remember:

```text
std::move = cast
move constructor/assignment = actual resource transfer
```
