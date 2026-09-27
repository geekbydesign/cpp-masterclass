# RVO and NRVO

Return Value Optimization (RVO) and Named Return Value Optimization (NRVO) allow the compiler to construct the result directly in its final destination.

## RVO

Returning a temporary:

```cpp
Widget create()
{
    return Widget{};
}
```

Modern C++ can construct the result directly in the caller.

For eligible prvalues, C++17 provides guaranteed copy elision in many cases.

## NRVO

Returning a named local object:

```cpp
Widget create()
{
    Widget w;
    return w;
}
```

The compiler may construct `w` directly in the caller's result storage.

This is NRVO.

Unlike the C++17 guaranteed cases for prvalue return, NRVO is generally an optimization rather than a guaranteed language rule.

## Do Not Force a Move

Prefer:

```cpp
Widget create()
{
    Widget w;
    return w;
}
```

over:

```cpp
Widget create()
{
    Widget w;
    return std::move(w);
}
```

The explicit `std::move` can prevent NRVO.

## Copy Elision vs Move

A return may conceptually look like:

```text
local -> move -> result
```

but copy elision can instead make it:

```text
construct directly in result
```

## Interview Summary

```text
RVO  = Return Value Optimization
NRVO = Named Return Value Optimization

RVO/guaranteed elision can eliminate copies/moves.
NRVO is generally optional.
Do not add std::move to local return values without a specific reason.
```
