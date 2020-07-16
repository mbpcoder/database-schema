# Blog database schema

## Users
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Avatar Id](#files)           | Unsigned Integer        | Null                | Foreign key on files        |
|  3   | Name                          | String(64)              | Not Null            |                             |
|  4   | Username                      | Char(32)                | Null                | Unique                      |
|  5   | Email                         | Char(128)               | Null                | Unique                      |
|  6   | Mobile                        | Char(16)                | Null                | Unique                      |
|  7   | Password                      | String(64)              | Not Null            |                             |
|  8   | Is Admin                      | Boolean                 | False               |                             |
|  9   | Disabled                      | Boolean                 | True                |                             |
|  10  | Description                   | Text                    | Null                |                             |
|  11  | Created At                    | Timestamp               | Current Timestamp   |                             |
|  12  | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  13  | Deleted At                    | Timestamp               | Null                |                             |

* [Never save password without hashing](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html)


## Categories
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Parent Id](#Categories)      | Unsigned Integer        | Null                | Foreign key on categories   |
|  3   | Name                          | String(64)              | Not Null            |                             |
|  4   | Slug                          | String(128)             | Not Null            | Unique                      |
|  5   | Disabled                      | Boolean                 | True                |                             |
|  6   | Created At                    | Timestamp               | Current Timestamp   |                             |
|  7   | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  8   | Deleted At                    | Timestamp               | Null                |                             |

## Posts
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Author Id](#users)           | Unsigned Integer        | Not Null            | Foreign key on users        |
|  3   | [Category Id](#categories)    | Unsigned Integer        | Not Null            | Foreign key on categories   |
|  4   | [Thumbnail Id](#files)        | Unsigned Integer        | Null                | Foreign key on files        |
|  5   | Title                         | String(128)             | Not Null            |                             |
|  6   | Summary                       | Text                    | Null                |                             |
|  7   | Body                          | Text                    | Not Null            |                             |
|  8   | Meta Description              | String(512)             | Null                |                             |
|  9   | Keywords                      | String(512)             | Null                |                             |
|  10  | Comment Count                 | Unsigned Integer        | 0                   |                             |
|  11  | Visit Count                   | Unsigned Integer        | 0                   |                             |
|  12  | Slug                          | String(128)             | Not Null            | Unique                      |
|  13  | Created At                    | Timestamp               | Current Timestamp   |                             |
|  14  | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  15  | Published At                  | Timestamp               | Null                |                             |
|  16  | Deleted At                    | Timestamp               | Null                |                             |

## Comments
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Post Id](#posts)             | Unsigned Integer        | Not Null            | Foreign key on posts        |
|  3   | [Reply To Id](#comments)      | Unsigned Integer        | Null                | Foreign key on comments     |
|  4   | [Author Id](#users)           | Unsigned Integer        | Null                | Foreign key on users        |
|  5   | Author Name                   | String(64)              | Null                |                             |
|  6   | Body                          | Text                    | Not Null            |                             |
|  7   | Created At                    | Timestamp               | Current Timestamp   |                             |
|  8   | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  9   | Published At                  | Timestamp               | Null                |                             |
|  10  | Deleted At                    | Timestamp               | Null                |                             |

## Files
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [User Id](#users)             | Unsigned Integer        | Not Null            | Foreign key on users        |
|  3   | [Post Id](#posts)             | Unsigned Integer        | Not Null            | Foreign key on posts        |
|  4   | Name                          | String(64)              | Not Null            |                             |
|  5   | Path                          | String(64)              | Not Null            | Unique                      |
|  6   | Published                     | Boolean                 | False               |                             |
|  7   | Created At                    | Timestamp               | Current Timestamp   |                             |
|  8   | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  9   | Deleted At                    | Timestamp               | Null                |                             |