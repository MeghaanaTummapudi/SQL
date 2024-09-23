import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    # print(world['area'])
    df = world[(world['area'] >= 3000000) | (world['population'] >= 25000000)][['name', 'population', 'area']]
    return df
    # print(world.dtypes)
