# Namespaces Across Files

A namespace can be defined across multiple translation units.

### `math.h`

```cpp
#pragma once

namespace math
{
    int add(int a, int b);
}
```

### `math.cpp`

```cpp
#include "math.h"

namespace math
{
    int add(int a, int b)
    {
        return a + b;
    }
}
```

### `main.cpp`

```cpp
#include "math.h"

int main()
{
    return math::add(2, 3);
}
```

The declaration is visible through the header, while the definition is provided by the source file.

## Important

The namespace itself does not need to be defined as one block in one file.

You can reopen the same namespace:

```cpp
namespace math
{
    int add(int, int);
}

// another file

namespace math
{
    int subtract(int, int);
}
```

## Typical Structure

```text
header (.h/.hpp)
    declarations

source (.cpp)
    definitions

main.cpp
    usage
```

## Interview Tip

Namespaces organize names; headers and source files organize **declarations and definitions across translation units**.
