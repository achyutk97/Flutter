from fastapi import FastAPI
from Panchanga import scrape_panchang_table

app = FastAPI(title= "Server", version= "0.1.0")

@app.get("/panchanga/{date}")
def get_panchanga(date: str, language):
    print(language)
    data = scrape_panchang_table(date, language)
    return data

