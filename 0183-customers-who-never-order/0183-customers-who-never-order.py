import pandas as pd

# SQL
# select c.name as Customers
# from Customers as c
# left join Orders as o
# on c.id = o.customerId
# where o.id is null
def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    merged_df = pd.merge(customers, orders, how = 'left', left_on = 'id', right_on = 'customerId')
    name = merged_df[merged_df['id_y'].isnull() == True][['name']]
    name.rename(columns = {'name' : 'Customers'}, inplace = True)
    return name