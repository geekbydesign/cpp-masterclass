# Pass by Pointer

Pass the address of an object:

```cpp
void update(int* p)
{
    if (p)
        *p = 100;
}

int x = 10;
update(&x);
```

Now `x` becomes `100`.

Pointers can represent "no object":

```cpp
update(nullptr);
```

### Use When

- Nullability is meaningful.
- Reseating/pointer semantics matter.
- Low-level APIs are involved.

**Interview:** A pointer parameter does not automatically imply ownership. Document ownership explicitly.
