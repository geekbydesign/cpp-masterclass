# Program Memory Map

A running C++ program uses different memory regions for different purposes. Exact layouts depend on the operating system, compiler, linker, ABI, and executable format.

## 1. Conceptual Layout

```text
+---------------------------+
| Stack                     |
| Automatic objects         |
| Function call frames     |
+---------------------------+
|                           |
| Heap / Dynamic Storage    |
| Dynamically allocated     |
| objects                   |
+---------------------------+
| Data                      |
| Initialized globals      |
| Initialized static data  |
+---------------------------+
| BSS                       |
| Zero-initialized /        |
| uninitialized static      |
| storage                   |
+---------------------------+
| Read-only data / Code     |
| Constants / instructions  |
+---------------------------+
```

This is a conceptual model, not a universal physical layout.

## 2. Stack

Local objects commonly have automatic storage duration:

```cpp
void f()
{
    int value = 10;
}
```

`value` has automatic storage duration.

## 3. Dynamic Storage

Dynamic allocation:

```cpp
int* p = new int(10);
delete p;
```

Modern C++ normally prefers RAII:

```cpp
auto p = std::make_unique<int>(10);
```

## 4. Global and Static Objects

```cpp
int globalValue = 10;
static int staticValue = 20;
```

These have static storage duration.

Their exact placement depends on the implementation.

## 5. Read-Only Data

String literals and other constant data may reside in read-only sections:

```cpp
const char* text = "Hello";
```

The string literal must not be modified.

## 6. Program Code

Compiled machine instructions are stored in executable code sections, commonly called text/code sections.

## 7. Storage Duration vs Memory Region

Do not confuse C++ storage duration with a particular memory segment.

C++ defines storage duration categories including:

- Automatic
- Static
- Thread
- Dynamic

The standard does not require one universal stack/heap/data layout.

## 8. Pointer Example

```cpp
int global = 10;

void function()
{
    int local = 20;
    int* dynamic = new int(30);

    delete dynamic;
}
```

Conceptually:

```text
global   -> static storage
local    -> automatic storage
dynamic  -> pointer itself is local;
            allocated int uses dynamic storage
```

## Interview Points

- Stack and heap are useful implementation concepts, not the complete C++ object model.
- A pointer variable and its pointee can have different storage durations.
- `new` uses dynamic storage.
- Local variables commonly have automatic storage duration.
- Global/static objects have static storage duration.
- C++ also supports thread storage duration.

**Key idea:** Distinguish the pointer object from the object it points to, and distinguish storage duration from implementation-specific memory regions.
