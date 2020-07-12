# Blog database schema

## Users
| Name                          | Type                    | Default             | Index                       |
| -------------                 |-------------            | -----               | -----                       |
| Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
| [Avatar Id](#files)           | Unsigned Integer        | Null                | Foreign key on files        |
| Name                          | String(64)              | Not Null            |                             |
| Username                      | Char(32)                | Null                | Unique                      |
| Email                         | Char(128)               | Null                | Unique                      |
| Mobile                        | Char(16)                | Null                | Unique                      |
| Password                      | String(64)              | Not Null            |                             |
| Is Admin                      | Boolean                 | False               |                             |
| Disabled                      | Boolean                 | True                |                             |
| Description                   | Text                    | Null                |                             |
| Created At                    | Timestamp               | Current Timestamp   |                             |
| Updated At                    | Timestamp               | Current Timestamp   |                             |
| Deleted At                    | Timestamp               | Null                |                             |

* [Never save password without hashing](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html)


## Categories
| Name                          | Type                    | Default             | Index                       |
| -------------                 |-------------            | -----               | -----                       |
| Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
| [Parent Id](#Categories)      | Unsigned Integer        | Null                | Foreign key on categories   |
| Name                          | String(64)              | Not Null            |                             |
| Slug                          | String(128)             | Not Null            | Unique                      |
| Created At                    | Timestamp               | Current Timestamp   |                             |
| Updated At                    | Timestamp               | Current Timestamp   |                             |
| Deleted At                    | Timestamp               | Null                |                             |

## Posts
| Name                          | Type                    | Default             | Index                       |
| -------------                 |-------------            | -----               | -----                       |
| Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
| [Author Id](#users)           | Unsigned Integer        | Not Null            | Foreign key on users        |
| [Category Id](#categories)    | Unsigned Integer        | Not Null            | Foreign key on categories   |
| [Thumbnail Id](#files)        | Unsigned Integer        | Null                | Foreign key on files        |
| Title                         | String(128)             | Not Null            |                             |
| Summary                       | Text                    | Null                |                             |
| Body                          | Text                    | Not Null            |                             |
| Meta Description              | String(512)             | Null                |                             |
| Keywords                      | String(512)             | Null                |                             |
| Comment Count                 | Unsigned Integer        | 0                   |                             |
| Visit Count                   | Unsigned Integer        | 0                   |                             |
| Slug                          | String(128)             | Not Null            | Unique                      |
| Created At                    | Timestamp               | Current Timestamp   |                             |
| Updated At                    | Timestamp               | Current Timestamp   |                             |
| Published At                  | Timestamp               | Null                |                             |
| Deleted At                    | Timestamp               | Null                |                             |

## Comments
| Name                          | Type                    | Default             | Index                       |
| -------------                 |-------------            | -----               | -----                       |
| Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
| [Post Id](#posts)             | Unsigned Integer        | Not Null            | Foreign key on posts        |
| [Reply To Id](#comments)      | Unsigned Integer        | Null                | Foreign key on comments     |
| [Author Id](#users)           | Unsigned Integer        | Null                | Foreign key on users        |
| Author Name                   | String(64)              | Null                |                             |
| Body                          | Text                    | Not Null            |                             |
| Created At                    | Timestamp               | Current Timestamp   |                             |
| Updated At                    | Timestamp               | Current Timestamp   |                             |
| Published At                  | Timestamp               | Null                |                             |
| Deleted At                    | Timestamp               | Null                |                             |

## Files
| Name                          | Type                    | Default             | Index                       |
| -------------                 |-------------            | -----               | -----                       |
| Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
| [User Id](#users)             | Unsigned Integer        | Not Null            | Foreign key on users        |
| [Post Id](#posts)             | Unsigned Integer        | Not Null            | Foreign key on posts        |
| Name                          | String(64)              | Not Null            |                             |
| Path                          | String(64)              | Not Null            | Unique                      |
| Published                     | Boolean                 | False               |                             |
| Created At                    | Timestamp               | Current Timestamp   |                             |
| Updated At                    | Timestamp               | Current Timestamp   |                             |
| Deleted At                    | Timestamp               | Null                |                             |

