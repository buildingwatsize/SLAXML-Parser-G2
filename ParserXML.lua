local SLAXML = require 'slaxdom'
local myxml = io.open('BookStore.xml'):read('*all')
local test = SLAXML:dom(myxml)
counter = 0
check = 0
function searchCategoryXML(Keyword)
  for i=1,60,1 do
    local CategoryName = test["root"]["el"][i]["attr"][1]["name"]
    local CategoryValue = test["root"]["el"][i]["attr"]["category"]
    local TitleName = test["root"]["el"][i]["el"][1]["name"]
    local TitleValue = test["root"]["el"][i]["el"][1]["kids"][1]["value"]
    local AuthorName = test["root"]["el"][i]["el"][2]["name"]
    local AuthorValue = test["root"]["el"][i]["el"][2]["kids"][1]["value"]
    local PublisherName = test["root"]["el"][i]["el"][3]["name"]
    local PublisherValue = test["root"]["el"][i]["el"][3]["kids"][1]["value"]
    local Publisher_DateName = test["root"]["el"][i]["el"][4]["name"]
    local Publisher_DateValue = test["root"]["el"][i]["el"][4]["kids"][1]["value"]
    local TypeName = test["root"]["el"][i]["el"][5]["name"]
    local TypeValue = test["root"]["el"][i]["el"][5]["kids"][1]["value"]
    local LanguageName = test["root"]["el"][i]["el"][6]["name"]
    local LanguageValue = test["root"]["el"][i]["el"][6]["kids"][1]["value"]
    local PriceName = test["root"]["el"][i]["el"][7]["name"]
    local PriceValue = test["root"]["el"][i]["el"][7]["kids"][1]["value"]

    if(string.match(CategoryValue,Keyword) or string.match(TitleValue,Keyword) or string.match(AuthorValue,Keyword) or string.match(TypeValue,Keyword))then
        print("~~~~~~~~~~  "..CategoryValue.."  ~~~~~~~~~~~~~")
        print(TitleName..": "..TitleValue)
        print(AuthorName..": "..AuthorValue)
        print(PublisherName..": "..PublisherValue)
        print(Publisher_DateName..": "..Publisher_DateValue)
        print(TypeName..": "..TypeValue)
        print(LanguageName..": "..LanguageValue)
        typeBook = string.gsub(TypeValue, "%s+", "")
        if(typeBook == "Kindle") then
          local FilesizeName = test["root"]["el"][i]["el"][7]["name"]
          local FilesizeValue = test["root"]["el"][i]["el"][7]["kids"][1]["value"]
          local PriceName2 = test["root"]["el"][i]["el"][8]["name"]
          local PriceValue2 = test["root"]["el"][i]["el"][8]["kids"][1]["value"]
          print(FilesizeName..": "..FilesizeValue)
          print(PriceName2..": "..PriceValue2.."\n")
        else 
          print(PriceName..": "..PriceValue.."\n")
        end
        counter = counter+1
        print("------------------------------------------------------------------------------")
      
    elseif(string.find(Keyword, "<") or check == 1) then
      check = 1
      Keyword = string.gsub(Keyword, "<","")
      typeBook = string.gsub(TypeValue, "%s+", "")
      if(typeBook == "Kindle") then
        Price = string.gsub(test["root"]["el"][i]["el"][8]["kids"][1]["value"], "%s+", "")
      else
        Price = string.gsub(test["root"]["el"][i]["el"][7]["kids"][1]["value"],"%s+","")
      end
      Price = string.sub(Price, 2, #Price)
      Price = tonumber(Price)
      Keyword = string.format("%.2f",Keyword)
      Keyword = tonumber(Keyword)
      if(Price <= Keyword) then
        print("~~~~~~~~~~  "..CategoryValue.."  ~~~~~~~~~~~~~")
        print(TitleName..": "..TitleValue)
        print(AuthorName..": "..AuthorValue)
        print(PublisherName..": "..PublisherValue)
        print(Publisher_DateName..": "..Publisher_DateValue)
        print(TypeName..": "..TypeValue)
        print(LanguageName..": "..LanguageValue)
        typeBook = string.gsub(TypeValue, "%s+", "")
        if(typeBook == "Kindle") then
          local FilesizeName = test["root"]["el"][i]["el"][7]["name"]
          local FilesizeValue = test["root"]["el"][i]["el"][7]["kids"][1]["value"]
          local PriceName2 = test["root"]["el"][i]["el"][8]["name"]
          local PriceValue2 = test["root"]["el"][i]["el"][8]["kids"][1]["value"]
          print(FilesizeName..": "..FilesizeValue)
          print(PriceName2..": "..PriceValue2.."\n")
        else 
          print(PriceName..": "..PriceValue.."\n")
        end
        counter = counter+1

        print("------------------------------------------------------------------------------")
        --]=====================================================================]
      end
    elseif(string.find(Keyword, ">") or check == 2) then
      check = 2
      Keyword = string.gsub(Keyword, ">","")
      typeBook = string.gsub(TypeValue, "%s+", "")
      if(typeBook == "Kindle") then
        Price = string.gsub(test["root"]["el"][i]["el"][8]["kids"][1]["value"], "%s+", "")
      else
        Price = string.gsub(test["root"]["el"][i]["el"][7]["kids"][1]["value"],"%s+","")
      end
      Price = string.sub(Price, 2, #Price)
      Price = tonumber(Price)
      Keyword = string.format("%.2f",Keyword)
      Keyword = tonumber(Keyword)
      if(Price >= Keyword) then
        print("~~~~~~~~~~  "..CategoryValue.."  ~~~~~~~~~~~~~")
        print(TitleName..": "..TitleValue)
        print(AuthorName..": "..AuthorValue)
        print(PublisherName..": "..PublisherValue)
        print(Publisher_DateName..": "..Publisher_DateValue)
        print(TypeName..": "..TypeValue)
        print(LanguageName..": "..LanguageValue)
        typeBook = string.gsub(TypeValue, "%s+", "")
        if(typeBook == "Kindle") then
          local FilesizeName = test["root"]["el"][i]["el"][7]["name"]
          local FilesizeValue = test["root"]["el"][i]["el"][7]["kids"][1]["value"]
          local PriceName2 = test["root"]["el"][i]["el"][8]["name"]
          local PriceValue2 = test["root"]["el"][i]["el"][8]["kids"][1]["value"]
          print(FilesizeName..": "..FilesizeValue)
          print(PriceName2..": "..PriceValue2.."\n")
        else 
          print(PriceName..": "..PriceValue.."\n")
        end
        counter = counter+1
        print("------------------------------------------------------------------------------")
      end
    end
  end
  print("Number of matching : "..counter)  
end
print("Insert Keyword for Search : ")
searchCategoryXML(io.read())