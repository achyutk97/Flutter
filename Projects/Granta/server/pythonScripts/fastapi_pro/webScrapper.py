from playwright.sync_api import sync_playwright

def web_scrapper(city):
    try:
        pw = sync_playwright().start() # start the playwright instance
        browser = pw.firefox.launch(headless= True) # launch the browser

        page = browser.new_page() # open a new page
        page.goto(f"https://weather.now/in/{city}") # navigate to the url
        
        data = page.locator("xpath=/html/body/div[5]/div/div/div[1]/div[1]/p[1]")
        print(data.text_content()) # print the weather data
        print(page.title()) 
        return data.text_content()
    except Exception as e:
        print("Error: ", e)
    finally:# print the title of the page
        browser.close()
        pw.stop() # stop the playwright instance
