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
