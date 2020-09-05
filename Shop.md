# Shop database schema

## Users
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Avatar Id](#files)           | Unsigned Integer        | Null                | Foreign key on files        |
|  3   | Name                          | String(64)              | Not Null            |                             |
|  4   | Username                      | Char(32)                | Null                | Unique                      |
|  5   | Email                         | Char(128)               | Null                | Unique                      |
|  6   | Email Verified At             | Timestamp               | Current Timestamp   |                             |
|  7   | Mobile                        | Char(16)                | Null                | Unique                      |
|  8   | Mobile Verified At            | Timestamp               | Current Timestamp   |                             |
|  9   | Password                      | String(64)              | Not Null            |                             |
|  10  | Is Admin                      | Boolean                 | False               |                             |
|  11  | Disabled                      | Boolean                 | True                |                             |
|  12  | Description                   | Text                    | Null                |                             |
|  13  | Created At                    | Timestamp               | Current Timestamp   |                             |
|  14  | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  15  | Deleted At                    | Timestamp               | Null                |                             |

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
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Category Id](#categories)    | Unsigned Integer        | Null			       | Foreign key on categories   |
|  3   | [Thumbnail Id](#files)        | Unsigned Integer        | Null                | Foreign key on files        |
|  4   | Slug                          | String(32)              | Not Null            | Unique                      |
|  5   | Name                          | String(128)             | Not Null            |                             |
|  6   | Summary                       | String(256)             | Null                |                             |
|  7   | Description                   | Text  			         | Not Null            |                             |
|  8   | Price                         | Unsigned Integer        | Not Null            |                             |
|  9   | Quantity                      | Unsigned Integer        | 0                   |                             |
|  10  | Priority                      | Unsigned Integer        | 0                   |                             |
|  11  | Disabled                      | Boolean                 | True                | 		                     |
|  12  | Created At                    | Timestamp               | Current Timestamp   |                             |
|  13  | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  14  | Deleted At                    | Timestamp               | Null                |                             |

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
|  4   | [State](#order-state-enum)    | Enum                    | Not Null            |                             |
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
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Issuer Id](#users)           | Unsigned Integer        | Not Null            | Foreign key on users        |
|  3   | [User Id](#users)             | Unsigned Integer        | Null                | Foreign key on users        |
|  4   | [Order Id](#orders)           | Unsigned Integer        | Not Null            | Foreign key on orders       |
|  5   | [Discount Id](#discounts)     | Unsigned Integer        | Null		             | Foreign key on discounts    |
|  6   | Amount                        | Unsigned Integer        | Not Null            |                             |
|  7   | Reference Number              | String(64)              | Null                |                             |
|  8   | Slug                          | String(64)              | Not Null            |                             |
|  9   | Title                         | String(128)             | Not Null            |                             |
|  10  | Description                   | Text                    | Null		             |                             |
|  11  | Paid At                       | Timestamp               | Null		             |                             |
|  12  | Expired At                    | Timestamp               | Null		             |                             |
|  13  | Created At                    | Timestamp               | Current Timestamp   |                             |
|  14  | Updated At                    | Timestamp               | Current Timestamp   |                             |

## Refunds 
payback money to users
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Issuer Id](#users)           | Unsigned Integer        | Not Null            | Foreign key on users        |
|  3   | [User Id](#users)             | Unsigned Integer        | Null                | Foreign key on users        |
|  4   | Amount                        | Unsigned Integer        | Not Null            |                             |
|  5   | Reference Number              | String(64)              | Null                |                             |
|  6   | Slug                          | String(64)              | Not Null            |                             |
|  7   | Title                         | String(128)             | Not Null            |                             |
|  8   | Description                   | Text                    | Null		             |                             |
|  9   | Paid At                       | Timestamp               | Null		             |                             |
|  10  | Created At                    | Timestamp               | Current Timestamp   |                             |

## Payment Transactions
|  #   | Name                          					| Type                    | Default             | Index                       |
| ---- | -------------                 					|-------------            | -----               | -----                       |
|  1   | Id                            					| Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [User Id](#users)             					| Unsigned Integer        | Null                | Foreign key on users        |
|  3   | [Invoice Id](#invoices)       					| Unsigned Integer        | Not Null            | Foreign key on invoices     |
|  4   | [Payment Method](#transaction-payment-method)  | Enum  			      | Not Null            |                             |
|  5   | Bank Name                     					| String(64)              | Null                |                             |
|  6   | Account                       					| String(64)              | Not Null            |                             |
|  7   | Card Number                   					| String(128)             | Not Null            |                             |
|  8   | IBAN                          					| String(128)             | Not Null            |                             |
|  9   | Amount                        					| Unsigned Integer        | Not Null            |                             |
|  10  | [Status](#transaction-status)     				| Enum  			      | Not Null            |                             |
|  11  | Tracking Code                 					| String(64) 	          | Not Null            |                             |
|  12  | Reference Number              					| String(64) 	          | Null                |                             |
|  13  | Details 	                   					| Text                    | Null                |                             |
|  14  | Description                   					| Text                    | Null	            |                             |
|  15  | Created At                    					| Timestamp               | Current Timestamp   |                             |

* Store bank transaction response to details(JSON, XML, ...)

## Transaction Payment Method
| Name                          | Description
| -------------                 |-------------            	|
| Card                          | 					      	|
| Account     			        | 					      	|
| ACH             				| 					      	|
| IPG                        	| Internet Payment Gateway	|
| USSD                   		| 					      	|
| Credit                       	| 					      	|
| Cash                   		| 					      	|

## Transaction Status
| Name                          | Description
| -------------                 |-------------            	|
| Pending                       | 					      	|
| Success     			        | 					      	|
| Failed           				| 					      	|

## Discounts
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [Issuer Id](#users)           | Unsigned Integer        | Not Null            | Foreign key on users        |
|  3   | [User Id](#users)             | Unsigned Integer        | Null     	       | Foreign key on users        |
|  4   | Code                          | String(64)              | Not Null            | Unique                      |
|  5   | Title                         | String(64)              | Not Null            |                             |
|  6   | Count				           | Unsigned Integer        | Null		           | 						     |
|  7   | Used Count			           | Unsigned Integer        | 0		           | 						     |
|  8   | Amount				           | Unsigned Integer        | Not Null            | 						     |
|  9   | Description                   | Text                    | Null		           |                             |
|  10  | Started At                    | Timestamp               | Null		           |                             |
|  11  | Expired At                    | Timestamp               | Null		           |                             |
|  12  | Created At                    | Timestamp               | Current Timestamp   |                             |

## Files
|  #   | Name                          | Type                    | Default             | Index                       |
| ---- | -------------                 |-------------            | -----               | -----                       |
|  1   | Id                            | Unsigned Integer        | Auto Increment      | Primary key                 |
|  2   | [User Id](#users)             | Unsigned Integer        | Null                | Foreign key on users        |
|  3   | [Post Id](#posts)             | Unsigned Integer        | Null                | Foreign key on posts        |
|  4   | [Product Id](#products)       | Unsigned Integer        | Null                | Foreign key on products     |
|  5   | Name                          | String(64)              | Not Null            |                             |
|  6   | Type                          | String(32)              | Not Null            | MIME type                   |
|  7   | Path                          | String(128)             | Not Null            | Unique                      |
|  8   | Hash                          | String(32)              | Not Null            |                             |
|  9   | Published                     | Boolean                 | False               |                             |
|  10  | Priority                      | Unsigned Integer        | 0                   |                             |
|  11  | Created At                    | Timestamp               | Current Timestamp   |                             |
|  12  | Updated At                    | Timestamp               | Current Timestamp   |                             |
|  13  | Deleted At                    | Timestamp               | Null                |                             |
