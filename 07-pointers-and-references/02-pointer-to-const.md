# Pointer to Const

## Syntax

```cpp
const int* ptr;
```

`ptr` points to a const `int`.

You cannot modify the pointed-to object through `ptr`.

```cpp
int value = 10;
const int* ptr = &value;

// *ptr = 20; // error
```

The pointer itself can change:

```cpp
int other = 30;
ptr = &other; // valid
```

## Alternative Syntax

```cpp
int const* ptr;
```

Same meaning as:

```cpp
const int* ptr;
```

## Important Point

The original object does not have to be const:

```cpp
int value = 10;
const int* ptr = &value;

value = 20; // valid
```

The restriction is specifically through `ptr`.

## Interview Rule

```cpp
const int* ptr;
```

means:

> `ptr` is a pointer to const `int`.

**Key idea:** The pointer can change, but the pointed-to value cannot be modified through that pointer.
