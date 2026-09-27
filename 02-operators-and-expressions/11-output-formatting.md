# Output Formatting

C++ stream output can be formatted using manipulators from `<iomanip>` and related facilities.

## 1. Basic Output

```cpp
#include <iostream>

std::cout << "Value: " << 42 << '\n';
```

## 2. Floating-Point Precision

```cpp
#include <iomanip>

double value = 12.34567;

std::cout << std::setprecision(3) << value;
```

Without `std::fixed`, `setprecision` controls the number of significant digits.

With `fixed`:

```cpp
std::cout << std::fixed
          << std::setprecision(2)
          << value;
```

Output:

```text
12.35
```

## 3. Scientific Notation

```cpp
std::cout << std::scientific
          << value;
```

## 4. Field Width

```cpp
std::cout << std::setw(10) << 42;
```

`setw` affects the next formatted output operation.

## 5. Alignment

```cpp
std::cout << std::left
          << std::setw(10)
          << "Name";
```

Right alignment:

```cpp
std::cout << std::right
          << std::setw(10)
          << "Name";
```

## 6. Fill Character

```cpp
std::cout << std::setfill('.')
          << std::setw(10)
          << 42;
```

Possible output:

```text
........42
```

`setfill` remains active until changed.

## 7. Boolean Formatting

Default:

```cpp
bool ready = true;

std::cout << ready;
```

Output:

```text
1
```

With:

```cpp
std::cout << std::boolalpha << ready;
```

Output:

```text
true
```

Disable it:

```cpp
std::cout << std::noboolalpha;
```

## 8. Number Bases

```cpp
int value = 255;

std::cout << std::dec << value << '\n';
std::cout << std::hex << value << '\n';
std::cout << std::oct << value << '\n';
```

Typical output:

```text
255
ff
377
```

## 9. Show Base Prefix

```cpp
std::cout << std::showbase
          << std::hex
          << 255;
```

Typical output:

```text
0xff
```

## 10. Resetting Format State

Many stream formatting settings persist.

For example:

```cpp
std::cout << std::hex << 100 << '\n';
std::cout << 200 << '\n';
```

The second value may also be printed in hexadecimal because the base setting persists.

Explicitly select the desired format when necessary:

```cpp
std::cout << std::dec << 200 << '\n';
```

## 11. `'\n'` vs `std::endl`

```cpp
std::cout << "Hello\n";
```

prints a newline.

```cpp
std::cout << "Hello" << std::endl;
```

prints a newline and flushes the stream.

For normal output, prefer `'\n'` unless you specifically need a flush.

## 12. Useful `<iomanip>` Manipulators

```text
std::setw()
std::setprecision()
std::setfill()
std::fixed
std::scientific
std::left
std::right
std::boolalpha
std::showbase
std::hex
std::oct
std::dec
```

## Example: Simple Table

```cpp
#include <iomanip>
#include <iostream>

int main()
{
    std::cout << std::left
              << std::setw(15) << "Name"
              << std::right
              << std::setw(10) << "Score"
              << '\n';

    std::cout << std::left
              << std::setw(15) << "Alice"
              << std::right
              << std::setw(10) << 95
              << '\n';
}
```

## Quick Revision

```text
setw        → field width
setprecision → precision
setfill     → fill character
fixed       → fixed-point notation
scientific  → scientific notation
hex         → hexadecimal
oct         → octal
dec         → decimal
boolalpha   → true/false instead of 1/0
endl        → newline + flush
'\n'        → newline only
```

## Interview Point

`std::endl` is not simply another spelling of `'\n'`; it also flushes the stream, which can have a performance cost when used unnecessarily.
