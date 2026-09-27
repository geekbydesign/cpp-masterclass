# First C++ Program

## 1. Minimal C++ Program

```cpp
#include <iostream>

int main()
{
    std::cout << "Hello, World!\n";
    return 0;
}
```

## 2. Breaking It Down

### `#include <iostream>`

Includes declarations for standard input/output facilities such as `std::cout` and `std::cin`.

`#include` is handled by the preprocessor before compilation.

### `int main()`

`main()` is the entry point of a hosted C++ program.

```cpp
int main()
{
    // program starts here
}
```

The return type is `int`.

### `std::cout`

Writes data to standard output.

```cpp
std::cout << "Hello";
std::cout << 42;
```

`<<` is the stream insertion operator.

### `\n`

Moves output to the next line.

```cpp
std::cout << "Hello\n";
```

Prefer `'\n'` when you only need a newline; `std::endl` also flushes the stream.

### `return 0`

Returning `0` from `main()` indicates successful termination.

In `main`, reaching the closing `}` is equivalent to returning `0`.

```cpp
int main()
{
    return 0;
}
```

is equivalent to:

```cpp
int main()
{
}
```

## 3. Statements and Semicolons

Most C++ statements end with `;`.

```cpp
int x = 10;
std::cout << x;
```

A block is enclosed in `{}`.

```cpp
if (x > 0)
{
    std::cout << x;
}
```

## 4. Comments

### Single-line

```cpp
// This is a comment
int x = 10;
```

### Multi-line

```cpp
/*
   This is a
   multi-line comment.
*/
```

## 5. Namespaces

Standard-library names are generally inside the `std` namespace.

```cpp
std::cout << "Hello";
```

Avoid putting:

```cpp
using namespace std;
```

in header files because it can introduce name collisions into every translation unit that includes the header.

## 6. Compilation

A simplified model is:

```text
source.cpp
   ↓
preprocessing
   ↓
compilation
   ↓
object file
   ↓
linking
   ↓
executable
```

Example with GCC:

```bash
g++ -std=c++17 main.cpp -o app
```

Run:

```bash
./app
```

On Windows:

```powershell
.\app.exe
```

## 7. Common Interview Points

- `main()` is the program entry point in a hosted C++ program.
- `#include` is a preprocessing operation.
- `std::cout` belongs to the standard library.
- `return 0` from `main()` indicates successful termination.
- C++ is compiled; it is not interpreted line-by-line like a scripting language.
- Compilation and linking are separate stages.

## 8. Example

```cpp
#include <iostream>

int main()
{
    int age = 30;

    std::cout << "Age: " << age << '\n';

    return 0;
}
```

## Quick Revision

```text
#include     → preprocessing
main()       → program entry point
std::cout    → standard output
<<           → stream insertion
'\n'         → newline
return 0     → successful termination
```
