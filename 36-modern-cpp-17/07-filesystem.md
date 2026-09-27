# `std::filesystem`

C++17 introduced the standard filesystem library.

Header:

```cpp
#include <filesystem>
namespace fs = std::filesystem;
```

## Paths

```cpp
fs::path path = "data/file.txt";
```

Useful operations:

```cpp
path.filename();
path.extension();
path.parent_path();
path.stem();
```

## Existence

```cpp
if (fs::exists(path))
{
}
```

## File Type

```cpp
fs::is_regular_file(path);
fs::is_directory(path);
```

## Create Directory

```cpp
fs::create_directory("output");
```

For nested directories:

```cpp
fs::create_directories("a/b/c");
```

## Iterate Directory

```cpp
for (const auto& entry : fs::directory_iterator("data"))
{
    std::cout << entry.path() << '\n';
}
```

Recursive traversal:

```cpp
for (const auto& entry :
     fs::recursive_directory_iterator("data"))
{
    std::cout << entry.path() << '\n';
}
```

## File Size

```cpp
auto size = fs::file_size(path);
```

## Rename / Remove

```cpp
fs::rename(oldPath, newPath);
fs::remove(path);
```

## Exceptions and Error Codes

Many filesystem operations can report errors through exceptions or `std::error_code` overloads.

Example:

```cpp
std::error_code ec;

if (!fs::exists(path, ec))
{
    // inspect ec
}
```

## Important

`std::filesystem` provides portable filesystem abstractions, but actual filesystem behavior still depends on the operating system.

## Interview Point

C++17 standardized filesystem functionality that previously often required platform APIs or third-party libraries.
