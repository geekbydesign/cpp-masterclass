# Forward Declarations

A forward declaration tells the compiler that a name exists without providing its complete definition.

## Function

```cpp
void process(int);
```

The compiler can compile calls:

```cpp
process(10);
```

The definition can appear elsewhere:

```cpp
void process(int value)
{
}
```

## Class

```cpp
class Engine;
```

Now `Engine` is a declared but incomplete type.

You can use certain forms:

```cpp
Engine* engine;
Engine& engineRef;
```

But you cannot generally do:

```cpp
Engine engine; // incomplete type
```

because the compiler needs the complete class definition to know its size.

## Header Example

### `car.h`

```cpp
class Engine;

class Car
{
public:
    void start();

private:
    Engine* engine;
};
```

### `car.cpp`

```cpp
#include "car.h"
#include "engine.h"

void Car::start()
{
    // Engine is complete here
}
```

## Benefits

Forward declarations can:

- reduce unnecessary includes
- reduce compilation dependencies
- improve build times
- help break circular dependencies

## Important

You cannot access members of an incomplete class without its complete definition.

```cpp
class Engine;

void f(Engine* e)
{
    // e->start(); // cannot use member without complete definition
}
```

## Interview Tip

Use forward declarations when you only need to refer to a type by pointer/reference or declare a function involving the type.

Include the full definition when the compiler needs the complete type.
