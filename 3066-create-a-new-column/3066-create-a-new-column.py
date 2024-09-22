import pandas as pd

def createBonusColumn(employees: pd.DataFrame) -> pd.DataFrame:
    # employees['bonus'] = employees['salary'] * 2
    # return employees
    bonus = employees.salary * 2
    employees = employees.assign(bonus = bonus)
    return employees