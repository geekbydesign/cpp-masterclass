# Moving Temporaries

Temporary objects are natural candidates for move operations.

```cpp
std::string makeName()
{
    return "Alice";
}

std::string name = makeName();
```

Modern C++ can often avoid both copying and moving through copy elision.

## Example With Explicit Move

```cpp
std::string create()
{
    std::string result = "hello";
    return std::move(result);
}
```

This may force a move where normal return:

```cpp
return result;
```

could allow NRVO.

Therefore, do **not** add `std::move` to local return statements without a reason.

## Temporary Passed to Function

```cpp
void consume(std::string&& value);

consume(std::string("hello"));
```

The temporary can bind to the rvalue-reference parameter.

## Key Idea

Temporaries are generally expiring objects, so move construction/assignment can transfer their resources when copy elision does not eliminate the operation.

## Interview Tip

Before discussing "move vs copy," check whether **copy elision** means neither operation actually occurs.
