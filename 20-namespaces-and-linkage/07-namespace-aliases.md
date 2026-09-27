# Namespace Aliases

A namespace alias gives a shorter name to an existing namespace.

```cpp
namespace VeryLongCompanyName
{
    namespace Graphics
    {
        void draw();
    }
}

namespace gfx = VeryLongCompanyName::Graphics;

gfx::draw();
```

## Benefits

- Reduces long qualified names.
- Improves readability.
- Useful with deeply nested third-party libraries.
- Can simplify versioned APIs.

## Alias Is Not a New Namespace

```cpp
namespace gfx = Company::Graphics;
```

`gfx` is another name for the existing namespace.

It does not create a separate namespace.

## Conditional Configuration

Aliases can also simplify platform-specific code:

```cpp
namespace platform
{
    // implementation selected elsewhere
}

namespace api = platform;
```

## Important

A namespace alias can be changed to point to another namespace, but existing declarations are not copied.

## Interview Tip

Remember:

```text
namespace alias = existing namespace
```

It is an alias, not a new scope containing duplicated members.
