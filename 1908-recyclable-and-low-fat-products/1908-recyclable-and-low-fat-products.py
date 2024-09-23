import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    # print(products.dtypes)
    return products[(products['low_fats'] == 'Y') & (products['recyclable'] == 'Y')] [['product_id']]