import pandas as pd
# select distinct author_id as id
# from views
# where author_id = viewer_id
# order by author_id asc
def article_views(views: pd.DataFrame) -> pd.DataFrame:
    df = views[views['author_id'] == views['viewer_id']].sort_values('author_id')['author_id'].unique()
    f_df = pd.DataFrame(df, columns = ['id'])
    return f_df