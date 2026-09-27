# Linkage

Linkage determines whether a name declared in one scope can refer to the same entity as a declaration in another scope.

Main categories:

```text
external linkage
internal linkage
no linkage
```

## External Linkage

A name can be referred to from other translation units.

```cpp
int globalValue = 10;
```

A declaration in another translation unit can refer to it:

```cpp
extern int globalValue;
```

## Internal Linkage

The entity is associated only with its translation unit.

Example:

```cpp
namespace
{
    int helperValue = 10;
}
```

Namespace-scope `static` can also give internal linkage:

```cpp
static int helperValue = 10;
```

## No Linkage

Local variables normally have no linkage:

```cpp
void f()
{
    int x = 10;
}
```

The local name `x` is not the same entity as a local `x` in another function.

## Linkage vs Visibility

Do not treat linkage and visibility as exactly the same concept.

Linkage answers whether declarations can denote the same entity across scopes/translation units.

## Interview Tip

Think:

```text
external -> can be shared across translation units
internal -> limited to one translation unit
none     -> name identifies only its local entity
```
