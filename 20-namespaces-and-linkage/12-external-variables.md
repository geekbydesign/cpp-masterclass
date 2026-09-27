# External Variables

`extern` is commonly used to declare a variable defined in another translation unit.

### `globals.h`

```cpp
#pragma once

extern int g_counter;
```

### `globals.cpp`

```cpp
int g_counter = 0;
```

### `main.cpp`

```cpp
#include "globals.h"

int main()
{
    ++g_counter;
}
```

## Declaration vs Definition

```cpp
extern int value; // declaration
int value = 10;   // definition
```

Do not put a non-inline variable definition in a commonly included header:

```cpp
int value = 10; // problematic in multiple translation units
```

## `extern` Does Not Mean "Global"

`extern` mainly communicates that the declaration refers to an entity defined elsewhere.

## `extern const`

Namespace-scope `const` variables normally have internal linkage unless explicitly given external linkage.

For example:

```cpp
extern const int value;
```

can declare an externally linked const object whose definition is provided elsewhere.

## Interview Tip

A common pattern is:

```text
header:
extern declaration

one .cpp:
actual definition
```
