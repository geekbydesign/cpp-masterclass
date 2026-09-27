# Input and Output

C++ provides stream-based input/output through the standard library.

```cpp
#include <iostream>
```

## 1. Standard Output

### `std::cout`

```cpp
std::cout << "Hello\n";
```

Multiple values:

```cpp
int age = 30;
std::cout << "Age: " << age << '\n';
```

## 2. Standard Input

### `std::cin`

```cpp
int age;
std::cin >> age;
```

Multiple values:

```cpp
int age;
double salary;

std::cin >> age >> salary;
```

`>>` is the stream extraction operator.

## 3. Reading Strings

```cpp
std::string name;
std::cin >> name;
```

This reads one whitespace-delimited token.

For a complete line:

```cpp
std::getline(std::cin, name);
```

Example:

```cpp
std::string name;

std::cout << "Enter your name: ";
std::getline(std::cin, name);

std::cout << "Hello " << name << '\n';
```

## 4. Mixing `cin >>` and `getline`

This is a common issue.

```cpp
int age;
std::string name;

std::cin >> age;
std::getline(std::cin, name);
```

After `std::cin >> age`, the newline may remain in the input buffer.

A common approach is:

```cpp
std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
std::getline(std::cin, name);
```

Include:

```cpp
#include <limits>
```

## 5. Output Formatting

```cpp
#include <iomanip>

double value = 12.34567;

std::cout << std::fixed << std::setprecision(2)
          << value << '\n';
```

Output:

```text
12.35
```

Useful manipulators include:

- `std::fixed`
- `std::scientific`
- `std::setprecision`
- `std::setw`
- `std::setfill`
- `std::left`
- `std::right`

## 6. `std::cerr`

Used for diagnostic/error output.

```cpp
std::cerr << "Error occurred\n";
```

## 7. `std::clog`

Used for logging output.

```cpp
std::clog << "Starting application\n";
```

## 8. Stream State

Input streams maintain state flags.

Important states:

- `good()`
- `fail()`
- `bad()`
- `eof()`

Example:

```cpp
int value;

if (std::cin >> value)
{
    std::cout << "Valid input\n";
}
else
{
    std::cout << "Invalid input\n";
}
```

## 9. Boolean Input/Output

By default:

```cpp
bool value = true;
std::cout << value;
```

prints:

```text
1
```

Use:

```cpp
std::cout << std::boolalpha << value;
```

to print:

```text
true
```

## 10. Character Input

```cpp
char ch;
std::cin >> ch;
```

For a character including whitespace:

```cpp
ch = std::cin.get();
```

## Quick Revision

```text
cout      → output
cin       → input
cerr      → error/diagnostic output
clog      → logging
getline   → read an entire line
>>        → extraction
<<        → insertion
```

## Interview Points

- `operator>>` skips leading whitespace for many formatted inputs.
- `getline()` reads until the delimiter, normally `'\n'`.
- Mixing `>>` and `getline()` can leave a newline pending.
- Stream state determines whether an input operation succeeded.
