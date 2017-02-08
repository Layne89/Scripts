tell application "System Events"
	tell network preferences
		set cname to name of current location
		set rValue to (display dialog "Current Location: " & cname buttons {"Cancel", "Change"} default button "Change" with title "Information")
		if ((button returned of rValue) = "Change") then
			set cname to name of current location
			if (cname = "superIP") then
				do shell script "scselect 'commonIP'"
			else
				do shell script "scselect 'superIP'"
			end if
		end if
	end tell
end tell
