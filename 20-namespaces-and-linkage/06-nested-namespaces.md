# Nested Namespaces

A namespace can contain another namespace.

```cpp
namespace Company
{
    namespace Graphics
    {
        void draw();
    }
}
```

Access:

```cpp
Company::Graphics::draw();
```

## C++17 Nested Namespace Syntax

C++17 introduced compact syntax:

```cpp
namespace Company::Graphics
{
    void draw();
}
```

Equivalent to:

```cpp
namespace Company
{
    namespace Graphics
    {
        void draw();
    }
}
```

## Why Nest?

Nested namespaces can organize large libraries:

```text
Company
└── Graphics
    ├── Renderer
    └── Image
```

## Namespace Alias

A long namespace can be shortened:

```cpp
namespace gfx = Company::Graphics;

gfx::draw();
```

## Inline Namespaces

Inline namespaces provide special lookup behavior and are commonly used for versioning:

```cpp
namespace Library
{
    inline namespace V2
    {
        void process();
    }
}
```

`Library::process()` can find the member of the inline namespace.

## Interview Tip

C++17 syntax:

```cpp
namespace A::B::C
{
}
```

is simply a concise way to declare nested namespaces.
