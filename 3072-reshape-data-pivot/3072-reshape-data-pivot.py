import pandas as pd

def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    return weather.pivot(columns = ['city'], index = 'month', values = 'temperature' )