# Inline Variables

C++17 introduced inline variables.

They allow a variable to be defined in a header and included by multiple translation units without violating the ODR, provided the definitions satisfy the required rules.

```cpp
// config.h
#pragma once

inline int maxConnections = 10;
```

Multiple `.cpp` files can include the header.

## Why?

Before C++17, global variables in headers commonly required:

```cpp
// header
extern int value;

// one source file
int value = 10;
```

C++17 allows:

```cpp
inline int value = 10;
```

directly in the header.

## Inline Static Data Members

C++17 also allows:

```cpp
class Config
{
public:
    inline static int maxConnections = 10;
};
```

No separate out-of-class definition is required.

## Important

`inline` does **not** mean:

```text
"the compiler must inline accesses"
```

Here it primarily provides an ODR/linkage facility for multiple definitions of the same inline entity.

## Interview Tip

```text
inline function  -> multiple identical definitions allowed
inline variable  -> multiple identical definitions allowed
```

The definitions must satisfy the language's ODR requirements.
