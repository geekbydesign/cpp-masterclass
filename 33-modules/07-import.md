# `import`

`import` makes a module's exported declarations available to the importing translation unit.

```cpp
import math;

int result = add(10, 20);
```

## Import a Module

```cpp
import math;
```

## Import a Partition

Within the owning module, a partition can be imported:

```cpp
module math;

import :addition;
```

## Re-export

A module interface can re-export another module or partition:

```cpp
export import :addition;
```

This makes the imported interface available to users of the importing module.

## Module vs Header

```cpp
#include "math.h"
```

performs textual inclusion through the preprocessor.

```cpp
import math;
```

uses the module system.

## Important

`import` is not simply a replacement spelling for `#include`. Modules have their own compilation, visibility, ownership, and reachability rules.
