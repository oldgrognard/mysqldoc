#### customer
Collection of existing customers
| Key  | Column | Type        | Default | Nullable | Comment |
| ---- | ------ | ----------- | ------- | -------- | ------- |
| &#128273; | customer_number | int(11) |  | &#128683; | Our assigned customer number |
|  | customer_name | varchar(50) |  | &#128683; | Company or individual name |
|  | contact_last_name | varchar(50) |  | &#128683; | Company contact's last name |
|  | contact_first_name | varchar(50) |  | &#128683; | Company contact's first name |
|  | phone | varchar(50) |  | &#128683; |  |
|  | address_line_1 | varchar(50) |  | &#128683; |  |
|  | address_line_2 | varchar(50) | empty string | &#128683; |  |
|  | city | varchar(50) | empty string | &#128683; |  |
|  | state | varchar(50) | empty string | &#128683; |  |
|  | postal_code | varchar(15) | empty string | &#128683; |  |
|  | country | varchar(50) | empty string | &#128683; |  |
| &#128477; | sales_rep_employee_number | int(11) | 0 | &#128683; |  |
|  | credit_limit | decimal(10,2) | 0.00 | &#128683; |  |
