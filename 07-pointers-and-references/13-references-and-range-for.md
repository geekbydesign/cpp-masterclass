# References and Range-Based `for`

Given:

```cpp
std::vector<int> values = {10, 20, 30};
```

## 1. By Value

```cpp
for (int value : values)
{
    value *= 2;
}
```

The vector is unchanged because `value` is a copy.

## 2. By Reference

```cpp
for (int& value : values)
{
    value *= 2;
}
```

Now the original elements are modified.

Result:

```text
20 40 60
```

## 3. By Const Reference

```cpp
for (const int& value : values)
{
    std::cout << value;
}
```

No element copy is made, and elements cannot be modified.

## 4. `auto` Forms

```cpp
for (auto value : values)         // copy
for (auto& value : values)        // mutable reference
for (const auto& value : values)  // const reference
```

## 5. Comparison

| Form | Copy? | Can modify original element? |
|---|---:|---:|
| `auto value` | Yes | No |
| `auto& value` | No | Yes |
| `const auto& value` | No | No |

For large objects, `const auto&` can avoid unnecessary copies.

## Example

```cpp
std::vector<std::string> names;

for (const auto& name : names)
{
    std::cout << name;
}
```

## Interview Point

Know the difference between:

```cpp
for (auto x : container)
```

and:

```cpp
for (auto& x : container)
```

The first copies each element; the second refers to the original element.

**Key idea:** `&` in a range-for determines whether the loop variable aliases the original element.
