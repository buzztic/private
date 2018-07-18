import os
import xlsxwriter
from re import search
import pandas as pd
from difflib import get_close_matches
import numpy as np
class Poster:
    
    def __init__(self):
        self.extensions = "jpg"
        self.path = "E:\\Cinéma LE KERFANY\\Annonces"
        self.path_movie = "E:\\Cinéma LE KERFANY\\Annonces\\Affiches.xlsx"
        self.no_accepted = ("400x533","3x2", " - Copie",  "400X525")

    def get_poster_paths(self):
        poster_paths = list()
        for (dirpath, dirnames, posternames) in os.walk(self.path):
            poster_paths += [
                os.path.join(dirpath, poster) 
                for poster in posternames
                if poster.endswith(self.extensions) and not poster.startswith('~$') and all(word not in poster.lower() for word in self.no_accepted)
            ]
        return poster_paths

    def get_names(self):
        paths = self.get_poster_paths()
        names = [
            os.path.basename(path) 
            for path in paths
        ]
        
        names_without_extension = [os.path.splitext(name)[0] for name in names]

        return names_without_extension

poster = Poster()


posters = pd.DataFrame(
    {'name': poster.get_names(), 'path': poster.get_poster_paths()}
)

movies = pd.read_excel(
    poster.path_movie, 
    usecols='A:F'
)

nearest_file_name = [
    get_close_matches(titre, poster.get_names(), n=1) 
    for titre in movies.TITRE
]


def extract_first_value(list):
    if list!=[]:
        return list[0]
    else:
        return None

extract_first_value([])

nearest = [
    extract_first_value(file) 
    for file in nearest_file_name
]



movies = movies.assign(poster_name=nearest)

movies = movies.merge(
  posters,
  how='left',
  left_on='poster_name',
  right_on='name'
)


movies.path.fillna('NO_POSTER', inplace=True)

writer = pd.ExcelWriter('test.xlsx', engine='xlsxwriter')
movies.to_excel(writer, sheet_name='Sheet1')

workbook  = writer.book
worksheet = workbook.get_worksheet_by_name('Sheet1')
# Widen the first column to make the text clearer.
worksheet.set_column(10, 10, 15)
for i in range(0, 500):
    worksheet.set_row(i, 90)

# Insert an image.
cell_names = ['K'+str(i) for i in range(1,500)]

for cell, path in zip(cell_names, movies["path"].tolist()):
    if path!='NO_POSTER':
        worksheet.insert_image(cell, path, {'x_scale': 0.1, 'y_scale': 0.1})

workbook.close()
