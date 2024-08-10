# Terraform Built-in Functions

#### 1. **`abs`**
- **Description**: Returns the absolute value of a number.
- **Example**:
  ```hcl
  result = abs(-5)
  # result = 5
  ```

#### 2. **`basename`**
- **Description**: Returns the last part of a file path.
- **Example**:
  ```hcl
  result = basename("/home/user/file.txt")
  # result = "file.txt"
  ```

#### 3. **`base64decode`**
- **Description**: Decodes a Base64-encoded string.
- **Example**:
  ```hcl
  result = base64decode("aGVsbG8gd29ybGQ=")
  # result = "hello world"
  ```

#### 4. **`base64encode`**
- **Description**: Encodes a string using Base64.
- **Example**:
  ```hcl
  result = base64encode("hello world")
  # result = "aGVsbG8gd29ybGQ="
  ```

#### 5. **`ceil`**
- **Description**: Rounds a number up to the nearest integer.
- **Example**:
  ```hcl
  result = ceil(4.2)
  # result = 5
  ```

#### 6. **`coalesce`**
- **Description**: Returns the first non-null argument.
- **Example**:
  ```hcl
  result = coalesce(null, null, "first non-null")
  # result = "first non-null"
  ```

#### 7. **`concat`**
- **Description**: Concatenates multiple lists into a single list.
- **Example**:
  ```hcl
  result = concat(["a", "b"], ["c", "d"])
  # result = ["a", "b", "c", "d"]
  ```

#### 8. **`contains`**
- **Description**: Checks if a list contains a specific value.
- **Example**:
  ```hcl
  result = contains(["a", "b", "c"], "b")
  # result = true
  ```

#### 9. **`element`**
- **Description**: Returns the element at the specified index in a list.
- **Example**:
  ```hcl
  result = element(["a", "b", "c"], 1)
  # result = "b"
  ```

#### 10. **`file`**
- **Description**: Reads the contents of a file.
- **Example**:
  ```hcl
  result = file("/path/to/file.txt")
  # result = "file content"
  ```

#### 11. **`floor`**
- **Description**: Rounds a number down to the nearest integer.
- **Example**:
  ```hcl
  result = floor(4.8)
  # result = 4
  ```

#### 12. **`format`**
- **Description**: Formats a string using placeholders.
- **Example**:
  ```hcl
  result = format("Hello, %s!", "world")
  # result = "Hello, world!"
  ```

#### 13. **`formatlist`**
- **Description**: Formats a list of strings using placeholders.
- **Example**:
  ```hcl
  result = formatlist("Item %d", [1, 2, 3])
  # result = ["Item 1", "Item 2", "Item 3"]
  ```

#### 14. **`index`**
- **Description**: Finds the index of a given element in a list.
- **Example**:
  ```hcl
  result = index(["a", "b", "c"], "b")
  # result = 1
  ```

#### 15. **`join`**
- **Description**: Joins a list of strings into a single string using a separator.
- **Example**:
  ```hcl
  result = join(", ", ["a", "b", "c"])
  # result = "a, b, c"
  ```

#### 16. **`length`**
- **Description**: Returns the number of elements in a list or length of a string.
- **Example**:
  ```hcl
  result = length(["a", "b", "c"])
  # result = 3
  ```

#### 17. **`lookup`**
- **Description**: Retrieves the value from a map by its key, with a default fallback.
- **Example**:
  ```hcl
  result = lookup({"key1" = "value1", "key2" = "value2"}, "key1", "default")
  # result = "value1"
  ```

#### 18. **`lower`**
- **Description**: Converts a string to lowercase.
- **Example**:
  ```hcl
  result = lower("Hello World")
  # result = "hello world"
  ```

#### 19. **`max`**
- **Description**: Returns the maximum value from a list of numbers.
- **Example**:
  ```hcl
  result = max(1, 5, 3)
  # result = 5
  ```

#### 20. **`min`**
- **Description**: Returns the minimum value from a list of numbers.
- **Example**:
  ```hcl
  result = min(1, 5, 3)
  # result = 1
  ```

#### 21. **`split`**
- **Description**: Splits a string into a list of strings based on a separator.
- **Example**:
  ```hcl
  result = split(",", "a,b,c")
  # result = ["a", "b", "c"]
  ```

#### 22. **`substr`**
- **Description**: Extracts a substring from a string.
- **Example**:
  ```hcl
  result = substr("Hello, world!", 7, 5)
  # result = "world"
  ```

#### 23. **`timestamp`**
- **Description**: Returns the current UTC timestamp.
- **Example**:
  ```hcl
  result = timestamp()
  # result = "2023-08-10T14:52:04Z"
  ```

#### 24. **`upper`**
- **Description**: Converts a string to uppercase.
- **Example**:
  ```hcl
  result = upper("hello world")
  # result = "HELLO WORLD"
  ```

#### 25. **`zipmap`**
- **Description**: Creates a map from two lists: one of keys and one of values.
- **Example**:
  ```hcl
  result = zipmap(["a", "b"], ["x", "y"])
  # result = {"a" = "x", "b" = "y"}
  ```
