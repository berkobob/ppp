# ppp

An app to import items from Apple Reminders, Google Tasks and Microsoft OneNote. Items can then be grouped together and made into blocks which are then scheduled for completion via Google tasks.

## Sources

* Reminders from Apple Reminders
* Tasks from Google Tasks
* Notes from Microsoft OneNote
 
## iOS integration

Add the following key/value pair to your Info.plist
>
> `<key>NSRemindersUsageDescription</key>`
> 
> `<string>INSERT_REASON_HERE</string>`
> 


>`<key>CFBundleURLTypes</key>`
>`	<array>`
>`		<dict>`
>`			<key>CFBundleTypeRole</key>`
>`			<string>Editor</string>`
>`			<key>CFBundleURLSchemes</key>`
>`			<array>`
>`				<string>com.googleusercontent.apps.176353477956-bdgb338e3dgvb8umjk53gu4he6akla0d</string>`
>`			</array>`
>`		</dict>`
>`	</array>`


## To be done
TODO Look into a refresh option
TODO Tasks - capture list only, onenote - all pages, reminders - reminders and capture only