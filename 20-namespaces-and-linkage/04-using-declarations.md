# Using Declarations

A using declaration introduces a specific name into the current scope.

```cpp
using std::cout;
using std::string;

cout << "Hello";
string name = "Alice";
```

## Namespace Qualification

Without:

```cpp
std::cout
std::string
```

With:

```cpp
using std::cout;
using std::string;
```

## Using Declaration vs Using Directive

Using declaration:

```cpp
using std::cout;
```

Introduces a specific name.

Using directive:

```cpp
using namespace std;
```

Makes names from the namespace available for unqualified lookup in the relevant scope.

## Prefer Specific Names

In headers especially, avoid:

```cpp
using namespace std;
```

because it can pollute the namespace of code that includes the header.

Prefer:

```cpp
using std::string;
```

when appropriate.

## Namespace Member Alias

You can also introduce a specific namespace member:

```cpp
namespace math
{
    int add(int, int);
}

using math::add;
```

## Interview Tip

A **using declaration** names a specific entity; a **using directive** brings a namespace's members into unqualified lookup.
