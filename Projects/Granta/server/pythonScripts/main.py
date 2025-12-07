import flet as ft
import json
import sys
import os

FLUTTER_APPLICATION_DIR = r"C:\Users\achyu\OneDrive\Documents\workspace\Granta\client\grantha"

# Json Combiner
def jsonCombiner():
    # Initialize an empty dictionary to hold the merged data
    merged_data = {}
    PATH = FLUTTER_APPLICATION_DIR + "./assets/json/LangFiles/"
    # Get the list of all files in the current directory
    json_files = [f for f in os.listdir(PATH) if f.endswith('.json')]

    # Loop through each JSON file and merge the data
    for json_file in json_files:
        with open(PATH + json_file, 'r', encoding="utf-8") as f:
            data = json.load(f)
            key = json_file.split(".")[0]
            # Merge the contents into the merged_data dictionary
            # Assuming each file has a dictionary structure
            merged_data[key] = {

            }
            merged_data[key].update(data)

    # Save the merged data into a new JSON file
    with open(FLUTTER_APPLICATION_DIR + './assets/json/merged_file.json', 'w', encoding="utf-8") as mf:
        json.dump(merged_data, mf, ensure_ascii=False, indent=4)

    print(f"Successfully merged {len(json_files)} JSON files into 'merged_file.json'")

contentLang = sys.argv[1]
def readingTheJsonData():
    myDict = {}
    with open(FLUTTER_APPLICATION_DIR + fr"/assets/json/LangFiles/{contentLang}.json", encoding="utf-8") as fd:
        data = fd.read()
        if data != "":
            myDict = json.loads(data)
        else:
            myDict['mainCategories'] = []
    return myDict

def saveToJsonFile(data):
    with open(FLUTTER_APPLICATION_DIR + fr"/assets\json\LangFiles/{contentLang}.json", "w", encoding="utf-8") as fd:
        myDict = json.dumps(data, ensure_ascii=False, indent=4)
        fd.write(myDict)
    jsonCombiner()


def MyPage(page1: ft.Page):

    GLOBAL_ID_COUNT  = 0 
    def button_clicked(e):
        t.value = f"Dropdown value is:  {dd.value}"
        
        if dd.value == "Add new Record":
            def submitClicked(e):
                def submitCategpories(e):
                    
                    global dd
                    sub = {
                        "name": name1.value,
                        "author": author.value,
                        "description":description.value
                    }
                    dictMy[name.value]['subCategories'].append(sub)
                    myDict['mainCategories'].insert(GLOBAL_ID_COUNT + 1, dictMy)
                    saveToJsonFile(myDict)
                    page1.controls.clear()
                    MyPage(page1)
                dictMy = {
                    name.value: {
                        "id": GLOBAL_ID_COUNT + 1,
                        "name": name.value,
                        "imgLink": image.value,
                        "subCategories": []
                    }
                    
                }
                if yesNo.value == "Yes":
                    name1 = ft.TextField(label="Enter the Stotram", multiline=True)
                    author = ft.TextField(
                        label="Enter Author Name",
                        multiline=True,
                        min_lines=1,
                        max_lines=3,
                    )
                    description = ft.TextField(
                        label="Enter Description",
                        multiline=True,
                        min_lines=1,
                        max_lines=5,
                    )
                    submitButton = ft.ElevatedButton(text="Submit", on_click=submitCategpories)
                    page.controls.extend([name1, author, description, submitButton])
                    page1.update()
                else:
                    myDict['mainCategories'].append(dictMy)
                    saveToJsonFile(myDict)
                    page1.controls.clear()
                    MyPage(page1)
                    
            name = ft.TextField(label="Enter Name", multiline=True)
            image = ft.TextField(label="Enter image", multiline=True)
            listOfData = [ft.dropdown.Option("Yes"), ft.dropdown.Option("No")]
            yesNo = ft.Dropdown(
                width=100,
                options=listOfData
            )
            submitButton = ft.ElevatedButton(text="Submit", on_click=submitClicked)
            page.controls.extend([name, image, yesNo, submitButton])
            page1.update()
        else:

            def submitClicked(e):
                def submitCategpories(e):
                    # print(name1.value)
                    # print(author.value)
                    # print(description.value)
                    sub = {
                        "name": name1.value,
                        "author": author.value,
                        "description":description.value
                    }
                    dictMy['subCategories'].append(sub)
                    myDict['mainCategories'][int(index[0]) - 1][index[1]].update(dictMy)
                    
                    # print(myDict['mainCategories'][int(index[0]) - 1][index[1]]['subCategories'])
                    saveToJsonFile(myDict)
                    page1.controls.clear()
                    MyPage(page1)
                    
                    
                dictMy = myDict['mainCategories'][int(index[0]) - 1][index[1]]
                dictMy['name'] = name.value
                dictMy['imgLink'] = image.value
                # print(dictMy)   
                if yesNo.value == "Yes":
                    # print(yesNo.value)
                    name1 = ft.TextField(label="Enter the Stotram", multiline=True)
                    author = ft.TextField(
                        label="Enter Author Name",
                        multiline=True,
                        min_lines=1,
                        max_lines=3,
                    )
                    description = ft.TextField(
                        label="Enter Description",
                        multiline=True,
                        min_lines=1,
                        max_lines=5,
                    )
                    submitButton = ft.ElevatedButton(text="Submit", on_click=submitCategpories)
                    page.controls.extend([name1, author, description, submitButton])
                    page1.update()
                elif yesNo.value == "Modify":
                    def submitClicked1(e):
                        # global myDict
                        print(yesNo1.value)
                        def submitCategpories1(e):
                            # global myDict
                            print(name1.value)
                            print(author.value)
                            print(description.value)
                            print(mainIndex.value)
                            print(idx.value)
                            index = mainIndex.value.split(".")
                            myDict = readingTheJsonData()
                            sub = {
                                "name": name1.value,
                                "author": author.value,
                                "description":description.value
                            }

                            data = myDict['mainCategories'][int(index[0])-1][index[1]]['subCategories'][int(idx.value)] = sub
                            saveToJsonFile(myDict)
                            page1.controls.clear()
                            MyPage(page1)
                            pass

                        data = yesNo1.value.split(".")
                        existingDict = myDict['mainCategories'][int(index[0])-1][index[1]]['subCategories'][int(data[0])]
                        name1 = ft.TextField(label="Enter the Stotram", multiline=True)
                        idx = ft.TextField(label="", multiline=True)
                        idx.value = data[0]
                        mainIndex = ft.TextField(label="", multiline=True)
                        mainIndex.value = index[0] +"." + index[1]
                        name1.value = existingDict['name']
                        author = ft.TextField(
                            label="Enter Author Name",
                            multiline=True,
                            min_lines=1,
                            max_lines=3,
                        )
                        author.value = existingDict['author']
                        description = ft.TextField(
                            label="Enter Description",
                            multiline=True,
                            min_lines=1,
                            max_lines=5,
                        )

                        description.value = existingDict['description']
                        submitButton = ft.ElevatedButton(text="Submit", on_click=submitCategpories1)
                        ss = ft.Column(
                            # scroll=ft.ScrollMode.ALWAYS,
                            expand=True, # first alternative
                            # height=page.height, # second alternative (without expand=True)
                            controls=[idx, mainIndex, name1, author, description, submitButton]
                        ),
                        page.controls.extend(ss)
                        page1.update()

                    # import pdb;pdb.set_trace()
                    listMy = []
                    for i in range(len(myDict['mainCategories'][int(index[0])-1][index[1]]['subCategories'])):
                        listMy.append(
                            ft.dropdown.Option(f"{i}.{myDict['mainCategories'][int(index[0])-1][index[1]]['subCategories'][i]['name']}")
                        )
                    
                    yesNo1 = ft.Dropdown(
                        options=listMy
                    )
                    submitButton = ft.ElevatedButton(text="Submit", on_click=submitClicked1)
                    page.controls.extend([yesNo1, submitButton])
                    
                    page1.update()
                else:
                    myDict['mainCategories'][int(index[0]) - 1][index[1]].update(dictMy)
                    saveToJsonFile(myDict)
                    page1.controls.clear()
                    MyPage(page1)
            index = dd.value.split(".")
            # print(index)
            indx = ft.Text(myDict['mainCategories'][int(index[0]) - 1][index[1]]['id'])
            name = ft.TextField(label="Headline", multiline=True)
            name.value = myDict['mainCategories'][int(index[0]) - 1][index[1]]['name']
            image = ft.TextField(label="Image Link", multiline=True)
            image.value = myDict['mainCategories'][int(index[0]) - 1][index[1]]['imgLink']
            listOfData = [ft.dropdown.Option("Yes"), ft.dropdown.Option("Modify"), ft.dropdown.Option("No")]
            yesNo = ft.Dropdown(
                width=100,
                options=listOfData
            )
            submitButton = ft.ElevatedButton(text="Submit", on_click=submitClicked)
            page.controls.extend([name, image, yesNo, submitButton])
            page1.update()
            

    myDict = readingTheJsonData()
    t = ft.Text()
    b = ft.ElevatedButton(text="Submit", on_click=button_clicked)
    listOfData = [ft.dropdown.Option("Add new Record")]
    
    for i in myDict['mainCategories']:
        GLOBAL_ID_COUNT += 1
        for k in i:
            listOfData.append(ft.dropdown.Option(f"{i[k]['id']}.{k}"))

    dd = ft.Dropdown(
        hint_text="Choose your stotram or create?",
        options=listOfData,
        autofocus=True,
    )
    # print(GLOBAL_ID_COUNT)
    page = ft.Column(
        scroll=ft.ScrollMode.ALWAYS,
         expand=True,
        controls=[
            dd, b, t
        ]
    )
    page1.auto_scroll = True
    page1.add(page)

def main(Page):
    MyPage(Page)



# jsonCombiner()
ft.app(target=main)