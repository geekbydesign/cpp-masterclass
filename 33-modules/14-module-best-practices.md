# Module Best Practices

Modules are most useful when their boundaries are designed deliberately.

## 1. Keep Interfaces Small

Export only what users need.

```cpp
export class Calculator {
public:
    int add(int, int);
};
```

Avoid exporting unnecessary implementation details.

## 2. Separate Interface and Implementation

For larger modules:

```text
module interface
      ↓
module implementation units
```

This keeps the public API easier to understand.

## 3. Use Partitions for Large Modules

Organize related pieces:

```text
graphics
├── :shapes
├── :rendering
└── :io
```

Use re-export when those pieces are part of the public module API.

## 4. Keep Namespaces

Modules do not replace namespaces.

Use namespaces for logical name organization and modules for compilation/dependency boundaries.

## 5. Minimize Dependencies

Avoid unnecessarily importing large dependency graphs into public interfaces.

A module's public dependencies can affect users of that module.

## 6. Export Intentionally

Treat exported declarations as API.

Changing them can affect every importer.

## 7. Understand Reachability

Do not assume that a declaration present in a module source file is automatically usable by importers.

## 8. Template Awareness

Exported templates must still obey normal template instantiation rules. Ensure the required definitions are available/reachable.

## 9. Build-System Awareness

Module builds differ from traditional header-based builds.

Compiler support, module dependency scanning, and build-system integration vary across toolchains.

## 10. Do Not Mix Models Blindly

Legacy headers and modules can coexist, but understand the distinction:

```cpp
#include <vector>
import my_module;
```

They use different mechanisms.

## Interview Summary

```text
Module      → compilation/dependency boundary
export      → public interface
import      → consume a module
partition   → split one named module
namespace   → organize names
reachability→ determines what declarations are available
```
