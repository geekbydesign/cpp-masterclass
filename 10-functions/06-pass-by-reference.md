# Pass by Reference

A reference parameter aliases the caller's object.

```cpp
void update(int& value)
{
    value = 100;
}

int x = 10;
update(x);
```

Now `x == 100`.

Unlike pointers, references:

- Must be initialized.
- Cannot be reseated.
- Do not represent a null state.

**Use:** When a valid object is required and the function may modify it.

**Interview trap:**

```cpp
ref = other;
```

assigns to the referred object; it does not reseat the reference.
