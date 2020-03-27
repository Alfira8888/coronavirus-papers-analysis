from bert_serving.client import BertClient
from IPython.display import display, HTML
from scipy.spatial import distance

import pandas as pd
import numpy as np


def display_most_similar_paragraphs(
    sentence: str, 
    paragraphs_df: pd.DataFrame, 
    covid_19_articles_df: pd.DataFrame,
    bc: BertClient,
    n: int = 5
):
    vectorized_question = np.array(bc.encode([sentence]).flat)
    
    vector_distance = paragraphs_df["bert_vector"] \
        .map(lambda v: distance.cosine(vectorized_question, v))
    idx = vector_distance.nsmallest(n=n).index
    closest_paragraphs_df = paragraphs_df.loc[idx]
    
    closest_paragraphs_iter = closest_paragraphs_df["paragraph_text"].iteritems()
    for i, ((paper_id, paragraph_order), paragraph_text) \
        in enumerate(closest_paragraphs_iter):
        try:
            paper = covid_19_articles_df.loc[paper_id]
            paper_title = paper["title"]
            display(HTML(f"<h4>{i + 1}. {paper_title}</h4><p>{paragraph_text}</p>"))
        except KeyError as e:
            logger.warning("Could not find the key %s", paper_id)
