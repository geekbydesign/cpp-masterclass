# `std::string_view`

C++17 introduced `std::string_view`, a non-owning view of a character sequence.

Header:

```cpp
#include <string_view>
```

## Basic Example

```cpp
std::string text = "hello";

std::string_view view = text;
```

The view does not own or copy the string data.

## Function Parameters

A common use is read-only string parameters:

```cpp
void print(std::string_view text)
{
    std::cout << text;
}
```

It can accept:

```cpp
print("hello");
print(std::string{"hello"});
```

## Important Lifetime Rule

The referenced characters must remain alive.

Bad:

```cpp
std::string_view getText()
{
    std::string text = "hello";
    return text; // dangling view
}
```

`text` is destroyed when the function returns.

## No Ownership

```text
std::string
→ owns characters

std::string_view
→ observes characters
```

## Common Operations

```cpp
view.size();
view.empty();
view.substr(...);
view.find(...);
view.front();
view.back();
```

## `data()`

```cpp
const char* p = view.data();
```

Do not assume `data()` points to a null-terminated string unless the underlying character sequence guarantees it.

## Interview Point

`std::string_view` is lightweight and non-owning. Its biggest danger is dangling when the underlying string or character buffer is destroyed.
