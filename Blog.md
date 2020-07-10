# Blog database schema

## Users
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Unsigned Integer        | auto increment      |
| Name                          | String(64)              | Not Null            |
| Username                      | Char(32)                | Null                |
| Email                         | Char(128)               | Null                |
| Mobile                        | Char(16)                | Null                |
| Password                      | String(64)              | Not Null            |
| Is Admin                      | Boolean                 | False               |
| Disabled                      | Boolean                 | True                |
| Description                   | Text                    | Null                |
| Created At                    | Timestamp               | Current Timestamp   |
| Updated At                    | Timestamp               | Current Timestamp   |
| Deleted At                    | Timestamp               | Null                |


## Categories
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Integer                 | auto increment      |
| [Parent Id](#Categories)      | Unsigned Integer        | Null                |
| Name                          | String(64)              | Not Null            |
| Slug                          | String(128)             | Not Null            |
| Created At                    | Timestamp               | Current Timestamp   |
| Updated At                    | Timestamp               | Current Timestamp   |
| Deleted At                    | Timestamp               | Null                |

## Posts
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Integer auto increment  | auto increment      |
| [Author Id](#users)           | Unsigned Integer        | Not Null            |
| [Category Id](#categories)    | Unsigned Integer        | Not Null            |
| [Thumbnail Id](#files)        | Unsigned Integer        | Null                |
| Title                         | String(128)             | Not Null            |
| Summary                       | Text                    | Null                |
| Body                          | Text                    | Not Null            |
| Meta Description              | String(512)             | Null                |
| Keywords                      | String(512)             | Null                |
| Comment Count                 | Unsigned Integer(0)     | 0                   |
| Visit Count                   | Unsigned Integer(0)     | 0                   |
| Slug                          | String(128)             | Not Null            |
| Created At                    | Timestamp               | Current Timestamp   |
| Updated At                    | Timestamp               | Current Timestamp   |
| Published At                  | Timestamp               | Null                |
| Deleted At                    | Timestamp               | Null                |

## Comments
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Integer auto increment  | auto increment      |
| [Post Id](#posts)             | Unsigned Integer        | Not Null            |
| [Reply To Id](#comments)      | Unsigned Integer        | Null                |
| [Author Id](#users)           | Unsigned Integer        | Null                |
| Author Name                   | String(64)              | Null                |
| Body                          | Text                    | Not Null            |
| Created At                    | Timestamp               | Current Timestamp   |
| Updated At                    | Timestamp               | Current Timestamp   |
| Published At                  | Timestamp               | Null                |
| Deleted At                    | Timestamp               | Null                |

## Files
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Integer                 | auto increment      |
| [user Id](#users)             | Unsigned Integer        | Not Null            |
| [Post Id](#posts)             | Unsigned Integer        | Not Null            |
| Name                          | String(64)              | Not Null            |
| Path                          | String(64)              | Not Null            |
| Published                     | Boolean                 | False               |
| Created At                    | Timestamp               | Current Timestamp   |
| Updated At                    | Timestamp               | Current Timestamp   |
| Deleted At                    | Timestamp               | Null                |

