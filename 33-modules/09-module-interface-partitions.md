# Module Interface Partitions

A module interface partition is an interface unit belonging to a named module.

```cpp
export module graphics:shapes;

export class Circle {
public:
    void draw();
};
```

The primary module interface can re-export it:

```cpp
export module graphics;

export import :shapes;
```

Now a consumer can simply write:

```cpp
import graphics;

Circle c;
```

## Non-Re-exported Partition

A partition can also be imported internally without being exported to module users:

```cpp
module graphics;

import :internal;
```

## Benefits

Partitions help:
- Split large interfaces.
- Organize related declarations.
- Hide implementation-oriented components.
- Reduce the size of individual module interface units.

## Important

The primary interface and its partitions are compiled as parts of the same named module.
