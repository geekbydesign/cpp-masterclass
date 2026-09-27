# Static Local Variables

A static local variable is declared inside a function but has static storage duration.

```cpp
void counter()
{
    static int count = 0;
    ++count;

    std::cout << count << '\n';
}
```

## Lifetime

Unlike an ordinary local variable:

```cpp
void f()
{
    int x = 0;
}
```

`x` is created and destroyed on each function call.

A static local:

```cpp
void f()
{
    static int x = 0;
}
```

exists for the lifetime of the program.

## Initialization

A static local variable is initialized the first time execution reaches its declaration.

```cpp
void f()
{
    static int x = initialize();
}
```

`initialize()` is called only once.

Since C++11, initialization of a function-local static is thread-safe.

```cpp
Singleton& instance()
{
    static Singleton object;
    return object;
}
```

Concurrent first-time calls will not cause multiple initialization of `object`.

## State across calls

```cpp
int nextId()
{
    static int id = 0;
    return ++id;
}
```

Results:

```text
1
2
3
...
```

## Lifetime vs scope

A static local variable has:

- **block scope** → accessible only inside its function/block
- **static storage duration** → exists until program termination

Scope and lifetime are different concepts.

## Destruction

A function-local static object with non-trivial destruction is destroyed during program termination.

## Common uses

- persistent function state
- lazy initialization
- function-local singleton objects
- caching

## Interview points

Remember:

```text
scope     → where the name can be accessed
lifetime  → how long the object exists
```

A static local has local scope but program-long storage duration.
