require 'roo'

xlsx = Roo::Spreadsheet.open('https://docs.google.com/spreadsheets/d/1LRSONrPhgRjaz-kqwDJCeIr3ndE4Fh04zA7t0-g_u6U')
xlsx = Roo::Excelx.new("./new_prices.xlsx")

# Use the extension option if the extension is ambiguous.
xlsx = Roo::Spreadsheet.open('./rails_temp_upload', extension: :xlsx)

xlsx.info
# => Returns basic info about the spreadsheet file

# Roo::Spreadsheet.open can accept both paths and File instances.

