#Time::DATE_FORMATS[:short_date] = lambda { |time| time.strftime("%d/%m/%Y %A %b %d") }
Time::DATE_FORMATS[:short_date] = lambda { |time| time.strftime("%d/%m/%Y") }
