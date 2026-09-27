# `std::print` and `std::println`

C++23 introduced standardized formatted output through `std::print` and `std::println`.

Header:

```cpp
#include <print>
```

## `std::print`

```cpp
std::print("Hello, {}!", name);
```

The `{}` placeholder is replaced by the corresponding argument.

## Multiple Arguments

```cpp
std::print("Name: {}, Age: {}", name, age);
```

## `std::println`

`std::println` prints and then adds a newline:

```cpp
std::println("Hello, {}!", name);
```

This is convenient when you would otherwise write:

```cpp
std::print("Hello, {}!\n", name);
```

## Formatting

C++23's printing facilities use the standard formatting machinery introduced in C++20.

Examples:

```cpp
std::print("{:.2f}", 3.14159);
```

```cpp
std::print("{:08}", 42);
```

## Compared with `std::cout`

Traditional:

```cpp
std::cout << "Value: " << value << '\n';
```

C++23:

```cpp
std::println("Value: {}", value);
```

The C++23 form is often more concise and makes the output format explicit.

## Important

`std::print` is not simply a renamed `std::cout`. It is based on the standard formatting facilities.

## Interview Point

Know the relationship:

```text
C++20 → std::format
C++23 → std::print / std::println
```

Support may depend on the compiler and standard library version.
