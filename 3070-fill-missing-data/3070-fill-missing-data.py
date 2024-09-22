import pandas as pd

def fillMissingValues(products: pd.DataFrame) -> pd.DataFrame:
    # use fillna to fill values to a pandas dataframe; here 0's to quantity column
    products.quantity.fillna(0, inplace = True)
    return products