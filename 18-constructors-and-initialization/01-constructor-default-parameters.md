# Constructor Default Parameters

## Overview

A constructor can have default arguments just like a normal function.

```cpp
class Box
{
public:
    Box(int width = 10, int height = 20)
        : width(width), height(height) {}

private:
    int width;
    int height;
};

Box a;       // 10, 20
Box b(50);   // 50, 20
Box c(50, 60);
```

## Key Points

- Default arguments are used when arguments are omitted.
- They are part of the constructor declaration.
- Avoid ambiguous overloads when combining constructors and default parameters.
- A constructor with all parameters having defaults can act like a default constructor for calls with no arguments.

## Interview Tip

Do not confuse **default constructor** with **constructor having default parameters**. A default constructor is a constructor that can be called with no arguments.
