# Command-Line Arguments

The traditional `main` signature is:

```cpp
int main(int argc, char* argv[])
{
}
```

## `argc`

Number of command-line arguments.

It is at least 1 in a hosted C++ implementation because `argv[0]` is provided, although its content is implementation-defined.

## `argv`

An array of C-string pointers.

```text
argv[0] -> program name/path
argv[1] -> first user argument
argv[2] -> second user argument
...
```

Example:

```cpp
#include <iostream>

int main(int argc, char* argv[])
{
    for (int i = 0; i < argc; ++i)
        std::cout << argv[i] << '\n';
}
```

Running:

```text
program.exe hello 123
```

might produce:

```text
program.exe
hello
123
```

Command-line arguments are strings. Convert numeric arguments explicitly:

```cpp
int value = std::stoi(argv[1]);
```

Validate `argc` before accessing `argv[1]`.

**Interview:** `argc` counts arguments; `argv` provides them as C-strings.
