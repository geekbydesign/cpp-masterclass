# References

## 1. What Is a Reference?

A reference is an alias for an existing object.

```cpp
int value = 10;
int& ref = value;
```

Then:

```cpp
ref = 20;
```

changes `value`.

## 2. Must Be Initialized

```cpp
int& ref; // error
```

## 3. Cannot Be Reseated

```cpp
int a = 10;
int b = 20;

int& ref = a;

ref = b;
```

This assigns `b`'s value to `a`; it does not make `ref` refer to `b`.

## 4. Function Parameter

```cpp
void update(int& value)
{
    value = 100;
}
```

Call:

```cpp
int x = 10;
update(x);
```

## 5. Returning a Reference

A function can return a reference when the referenced object outlives the function call:

```cpp
int& getElement(int arr[], int index)
{
    return arr[index];
}
```

Then:

```cpp
getElement(arr, 0) = 100;
```

Do not return a reference to a local variable.

## 6. Reference Identity

```cpp
int value = 10;
int& ref = value;

std::cout << &value;
std::cout << &ref;
```

Both expressions refer to the same object.

## Interview Points

- Reference must be initialized.
- Reference cannot be reseated.
- Reference provides alias semantics.
- Never return a reference to a local object.

**Key idea:** A reference is an alias, not a reseatable pointer.
