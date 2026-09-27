# Compilation Model

A C++ program is normally built from multiple **translation units**.

A translation unit is approximately:

```text
source file
+ included headers
+ preprocessing
= translation unit
```

## Typical Build Process

```text
.cpp files
   ↓
preprocessor
   ↓
translation units
   ↓
compiler
   ↓
object files
   ↓
linker
   ↓
executable/library
```

Example:

```text
main.cpp  -> main.o
math.cpp  -> math.o

main.o + math.o
       ↓
     linker
       ↓
   application
```

## Declaration vs Definition

Header:

```cpp
int add(int, int); // declaration
```

Source:

```cpp
int add(int a, int b) // definition
{
    return a + b;
}
```

The compiler can compile `main.cpp` knowing only the declaration.

The linker later connects the call to the definition.

## Important

The compiler generally works on one translation unit at a time.

The linker works across object files and libraries.

## Interview Tip

Understand this pipeline:

```text
preprocess -> compile -> assemble/object -> link
```

Exact implementation details vary by toolchain, but the translation-unit/linking model is fundamental C++ knowledge.
