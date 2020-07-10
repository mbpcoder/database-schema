# Blog database schema

## Users
| Name          | Type                    | Nullable  |
| ------------- |-------------            | -----     |
| Id            | Integer auto increment  | NN        |
| Name          | String(64)              | NN        |
| Username      | Char(32)                | N         |
| Email         | Char(128)               | N         |
| Mobile        | Char(16)                | N         |
| Password      | String(64)              | NN        |
| Is Admin      | Boolean(false)          | NN        |
| Disabled      | Boolean(true)           | NN        |
| Description   | Text                    | N         |
| Created At    | Timestamp               | NN        |
| Updated At    | Timestamp               | NN        |
| Deleted At    | Timestamp               | N         |


## Categories
| Name          | Type                    | Nullable  |
| ------------- |-------------            | -----     |
| Id            | Integer auto increment  | NN        |
| Parent Id     | Unsigned Integer        | N         |
| Name          | String(64)              | NN        |
| Slug          | String(128)             | NN        |
| Created At    | Timestamp               | NN        |
| Updated At    | Timestamp               | NN        |
| Deleted At    | Timestamp               | N         |

## Posts
| Name              | Type                    | Nullable  |
| -------------     |-------------            | -----     |
| Id                | Integer auto increment  | NN        |
| Author Id         | Unsigned Integer        | NN        |
| Category Id       | Unsigned Integer        | NN        |
| Thumbnail Id      | Unsigned Integer        | N         |
| Title             | String(128)             | NN        |
| Summary           | Text                    | N         |
| Body              | Text                    | NN        |
| Meta Description  | String(512)             | N         |
| Keywords          | String(512)             | N         |
| Comment Count     | Unsigned Integer(0)     | NN        |
| Visit Count       | Unsigned Integer(0)     | NN        |
| Slug              | String(128)             | NN        |
| Created At        | Timestamp               | NN        |
| Updated At        | Timestamp               | NN        |
| Published At      | Timestamp               | N         | 
| Deleted At        | Timestamp               | N         |

## Comments
| Name          | Type                    | Nullable  |
| ------------- |-------------            | -----     |
| Id            | Integer auto increment  | NN        |
| Post Id       | Unsigned Integer        | N         |
| Parent Id     | Unsigned Integer        | N         |
| Author Id     | Unsigned Integer        | N         |
| Author Name   | String(64)              | N         |
| Body          | Text                    | NN        |
| Created At    | Timestamp               | NN        |
| Updated At    | Timestamp               | NN        |
| Published At  | Timestamp               | N         | 
| Deleted At    | Timestamp               | N         |
