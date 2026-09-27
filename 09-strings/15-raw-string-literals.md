# Raw String Literals

## Why Raw Strings?

Normal strings require escaping:

```cpp
std::string path = "C:\\Users\\Sachin\\Documents";
```

Raw strings allow backslashes directly:

```cpp
std::string path = R"(C:\Users\Sachin\Documents)";
```

## Basic Syntax

```cpp
R"(text)"
```

Example:

```cpp
std::string text = R"(Hello\nWorld)";
```

The `\n` remains two characters.

## Multi-Line Text

```cpp
std::string text = R"(Line 1
Line 2
Line 3)";
```

## Custom Delimiters

If the content contains `)"`, use a custom delimiter:

```cpp
R"delimiter(Some text )" inside)delimiter"
```

General form:

```text
R"delimiter(content)delimiter"
```

## Common Uses

- File paths.
- Regular expressions.
- JSON/XML.
- Multi-line text.
- Code snippets.

## Interview Point

Raw string literals were introduced in C++11.

**Key idea:** Raw strings reduce escaping by treating most characters literally.
