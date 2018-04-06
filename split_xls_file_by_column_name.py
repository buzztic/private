import pandas as pd

file_sheet_1 = pd.read_excel("file.xlsx", 
    sheet_name=0)
file_sheet_2 = pd.read_excel("file.xlsx",
    sheet_name=1 )


unique_entitecode = file_sheet_1.EntiteCode.unique()


for entite_code in unique_entitecode:
    is_entite_code_1 = file_sheet_1.EntiteCode==entite_code
    file_filtered_1 = file_sheet_1[is_entite_code_1]

    is_entite_code_2 = file_sheet_2.EntiteCode==entite_code
    file_filtered_2 =file_sheet_2[is_entite_code_2]

    file_name = str(entite_code) + "_file.xlsx"

    writer = pd.ExcelWriter(file_name)
    katell_file_filtered_1.to_excel(writer,0)
    katell_file_filtered_2.to_excel(writer,1)
    writer.save()

