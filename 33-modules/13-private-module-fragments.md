# Private Module Fragments

A private module fragment provides a way to place implementation details in the same module interface unit after the module's public interface.

Syntax:

```cpp
export module mymodule;

export class Widget {
public:
    void run();
};

module :private;

void Widget::run()
{
    // implementation
}
```

## Purpose

The private module fragment can contain implementation details that are not part of the module's exported interface.

## Structure

```text
export module mymodule;
        ↓
public exported interface
        ↓
module :private;
        ↓
private implementation
```

## Important

The private module fragment is different from a normal module implementation unit.

It is specifically a mechanism for keeping implementation details in the same module interface unit while preventing them from being exported.

## Practical Use

It can be useful when:
- The module is intentionally kept in one source file.
- Small implementation details do not justify a separate implementation unit.
- The public interface should remain clearly separated from private code.
