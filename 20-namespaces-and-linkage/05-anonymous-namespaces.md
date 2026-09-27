# Anonymous Namespaces

An unnamed or anonymous namespace has no user-defined name.

```cpp
namespace
{
    int helperValue = 10;

    void helper()
    {
    }
}
```

Names in an unnamed namespace have internal linkage within the translation unit.

## Typical Use

```cpp
namespace
{
    void helper()
    {
        // private to this translation unit
    }
}
```

This is useful for implementation details that should not be externally accessible.

## Across Files

Two anonymous namespaces in different translation units represent different namespaces.

```text
file1.cpp -> private helper
file2.cpp -> private helper
```

They do not conflict with each other.

## Anonymous Namespace vs `static`

Historically, file-local functions and variables were often declared with namespace-scope `static`:

```cpp
static void helper();
```

An unnamed namespace is the modern C++ approach for giving namespace-scope entities internal linkage.

## Important

Anonymous namespaces do not provide object-oriented privacy. They provide translation-unit-level visibility/linkage behavior.

## Interview Tip

Think:

```text
anonymous namespace
        ↓
implementation detail
        ↓
internal linkage
```
