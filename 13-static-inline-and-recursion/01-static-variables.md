# Static Variables

`static` has different meanings depending on where it is used. A key common idea is that it can affect storage duration or linkage.

## Static local variable

A local variable declared with `static` has **static storage duration**.

```cpp
void counter()
{
    static int count = 0;
    ++count;

    std::cout << count << '\n';
}
```

Calls:

```cpp
counter(); // 1
counter(); // 2
counter(); // 3
```

The variable is initialized once and retains its value between calls.

## Static data member

A `static` data member belongs to the class rather than to each object.

```cpp
class Counter
{
public:
    static int count;
};

int Counter::count = 0;
```

There is one shared `count` for the class.

Since C++17, an inline static data member can be defined inside the class:

```cpp
class Counter
{
public:
    inline static int count = 0;
};
```

## Static at namespace/file scope

At namespace scope, `static` gives a name **internal linkage**:

```cpp
static int value = 10;
```

This name is limited to that translation unit.

For new C++ code, an unnamed namespace is generally preferred for internal-linkage names:

```cpp
namespace
{
    int value = 10;
}
```

## Important distinction

Do not treat all uses of `static` as the same feature.

| Context | Effect |
|---|---|
| Local variable | Static storage duration |
| Class data member | One member shared by the class |
| Namespace-scope variable/function | Internal linkage |

## Interview points

- Static local variables retain state between calls.
- Static local variables are initialized only once.
- Static class members are shared among objects.
- Namespace-scope `static` gives internal linkage.
- `static` has context-dependent meaning.
