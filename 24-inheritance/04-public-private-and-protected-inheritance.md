# Public, Private, and Protected Inheritance

The inheritance access specifier controls how inherited base members are exposed through the derived class.

## Public Inheritance

```cpp
class Derived : public Base {};
```

Mapping:

```text
Base public    -> Derived public
Base protected -> Derived protected
Base private   -> not directly accessible
```

This is the usual form for an **is-a** relationship.

## Protected Inheritance

```cpp
class Derived : protected Base {};
```

Mapping:

```text
Base public    -> Derived protected
Base protected -> Derived protected
Base private   -> not directly accessible
```

## Private Inheritance

```cpp
class Derived : private Base {};
```

Mapping:

```text
Base public    -> Derived private
Base protected -> Derived private
Base private   -> not directly accessible
```

## Important

The inheritance access specifier is different from the access specifiers of base members.

```cpp
class Derived : public Base
```

does not make Base's private members public.

## Default Inheritance

For `struct`:

```cpp
struct Derived : Base {};
```

inheritance is public by default.

For `class`:

```cpp
class Derived : Base {};
```

inheritance is private by default.

## Interview Tip

Public inheritance preserves the base public interface as public; protected/private inheritance changes how it is exposed.
