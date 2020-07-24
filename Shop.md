# Shop database schema

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

## Products
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Unsigned Integer        | auto increment      |

## Comments
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Product Id](#products)       | Unsigned Integer        | Not Null            | Foreign key on products     |
|  3   | [Reply To Id](#comments)      | Unsigned Integer        | Null                | Foreign key on comments     |
|  4   | [Author Id](#users)           | Unsigned Integer        | Null                | Foreign key on users        |
|  5   | Author Name                   | String(64)              | Null                |                             |
|  6   | Body                          | Text                    | Not Null            |                             |
|  7   | Created At                    | Timestamp               | Current Timestamp   |                             |
|  8   | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  9   | Published At                  | Timestamp               | Null                |                             |
|  10  | Deleted At                    | Timestamp               | Null                |                             |

## Orders
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [User Id](#users)             | Unsigned Integer        | Not Null            | Foreign key on users        |
|  3   | Tracking Code                 | String(32)              | Not Null            | Unique                      |
|  4   | Item Count                    | Unsigned Integer        | 0                   |                             |
|  5   | Items Price                   | Unsigned Integer        | 0                   |                             |
|  6   | Delivery Cost                 | Unsigned Integer        | 0                   |                             |
|  7   | Cash On Delivery              | Boolean                 | False               |                             |
|  8   | Value Added Tax               | Unsigned Integer        | 0                   |                             |
|  9   | Discount                      | Unsigned Integer        | 0                   |                             |
|  10  | Total Price                   | Unsigned Integer        | 0                   |                             |
|  11  | Pending                       | Boolean                 | True                | 		                     |
|  12  | Created At                    | Timestamp               | Current Timestamp   |                             |
|  13  | Updated At                    | Timestamp               | Current Timestamp   |                             |

## Order Items
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Order Id](#orders)           | Unsigned Integer        | Not Null            | Foreign key on orders       |
|  3   | [Product Id](#products)       | Unsigned Integer        | Not Null            | Foreign key on products     |
|  4   | Count                         | Unsigned Integer        | 0                   |                             |
|  5   | Price                         | Unsigned Integer        | 0                   |                             |
|  6   | Total Price                   | Unsigned Integer        | 0                   |                             |
|  7   | Created At                    | Timestamp               | Current Timestamp   |                             |
|  8   | Updated At                    | Timestamp               | Current Timestamp   |                             |

## Order Status
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Order Id](#orders)           | Unsigned Integer        | Not Null            | Foreign key on orders       |
|  3   | [User Id](#users)             | Unsigned Integer        | Not Null            | Foreign key on users        |
|  4   | [State](#order state enum)    | Enum                    | Not Null            |                             |
|  5   | Description                   | Text                    | Null                |                             |
|  6   | Created At                    | Timestamp               | Current Timestamp   |                             |

## Order State Enum
| Name                          | Description
| -------------                 |-------------            |
| Waiting                       | 					      |
| Paying     			        | 					      |
| Paid             				| 					      |
| Sent                        	| 					      |
| Cancel                   		| 					      |

## Invoices
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Unsigned Integer        | auto increment      |

## Payment Transactions
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Unsigned Integer        | auto increment      |

## Discounts
| Name                          | Type                    | Default             |
| -------------                 |-------------            | -----               |
| Id                            | Unsigned Integer        | auto increment      |

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
