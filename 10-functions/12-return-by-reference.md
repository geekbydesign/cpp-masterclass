# Return by Reference

A function can return a reference to an existing object:

```cpp
int& getElement(int arr[], int index)
{
    return arr[index];
}
```

Usage:

```cpp
getElement(arr, 0) = 100;
```

### Dangerous

```cpp
int& getValue()
{
    int x = 10;
    return x; // dangling reference
}
```

The local object dies when the function returns.

Return references only to objects whose lifetime safely exceeds the returned reference.

**Interview:** Returning a reference does not create a new object; it exposes an existing object.
