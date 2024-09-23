import pandas as pd
# select c.name as Customers
# from customers as c
# left join orders as o
# on c.id = o.customerId
# where o.customerId is null
def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
   final_df = pd.merge(customers, orders, how = 'left', left_on = 'id', right_on = 'customerId')
   f_df = final_df[final_df['customerId'].isnull()][['name']]
   f_df.rename(columns = {'name': 'Customers'}, inplace = True)
   return f_df
#    print(final_df)
