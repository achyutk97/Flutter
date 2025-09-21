from playwright.sync_api import sync_playwright

details = {}
details["ka"] = {}
details["mr"] = {}

def scrape_panchang_table(date, language):
    url = f"https://panchang.astrosage.com/panchang/tithi-today?date={date}&language={language}&lid=1261481"

    print(url)
    with sync_playwright() as p:
        browser = p.firefox.launch(headless=True, slow_mo=3000)
        page = browser.new_page()
        page.goto(url)
  
        # Wait for table to load
        table_xpath = "/html/body/div[3]/div[1]/div[2]/div/div[4]/div[1]/div/table"
        page.wait_for_selector(f"xpath={table_xpath}")

        # Get all rows
        rows = page.locator(f"xpath={table_xpath}/tbody/tr")


        dict_details = {}
        dict_details[date] = {}
        for i in range(rows.count()):
            row = rows.nth(i)
            key = row.locator("td").nth(0).inner_text().strip()
            value = row.locator("td").nth(1).inner_text().strip()
            dict_details[date][key] = value
        
        if dict_details:
            details[language].update(dict_details)

        # Print extracted details
        for k, v in details.items():
            print(f"{k}: {v}")

        with open("panchang_table_details.json", "w", encoding="utf-8") as f:
            import json
            json.dump(details, f, ensure_ascii=False, indent=4)
        browser.close()

        return dict_details

if __name__ == "__main__":
    from datetime import datetime, timedelta

    start_date = datetime(2025, 11, 23)
    end_date = datetime(2026, 12, 31)

    dates = []
    current = start_date
    while current <= end_date:
        dates.append(current.strftime("%d-%m-%Y"))
        current += timedelta(days=1)

    print(dates[:10])   # show first 10
    print("Total days:", len(dates))
    for i in dates:
        scrape_panchang_table(i, "ka")
