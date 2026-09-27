# String Modification

## Common Modifiers

```cpp
text.push_back('!');
text.pop_back();
text.append(" World");
```

## `insert`

```cpp
text.insert(5, " C++");
```

## `erase`

```cpp
text.erase(5, 4);
```

Removes 4 characters starting at index 5.

## `replace`

```cpp
text.replace(0, 5, "Hi");
```

## `resize`

```cpp
text.resize(10);
```

Or:

```cpp
text.resize(10, 'x');
```

## `clear`

```cpp
text.clear();
```

## Interview Points

Know:

```cpp
push_back()
pop_back()
append()
insert()
erase()
replace()
resize()
clear()
```

**Key idea:** `std::string` is a mutable dynamic sequence of characters.
