# iTunesMusicApp
This repo holds the code for iTunesMusicApp for a POC using VIP - clean-Swift Architecture.

## About App

This is a simple app which basically fetches a media details from the iTunesSearch API, and parses the JSON response into models which are `Codable` structs & ultimately displaying it in a collectionView. Every item is a product item which displays the details in a collectionView (grid as well as list). On tapping any of the item, user can get into the detail screen.
You can also play a video, book, podcast, song.

## Note for the Reviewers

**Covered most of the required activities**
- [x] Retrived data from the given endpoint 
- [x] Designed Search criteria screen
- [x] Designed Media Type selector screen
- [x] Designed Search Results screen
- [x] Designed Media Details screen
- [x] Followed VIP architecture
- [x] Unit tests
- [x] Clear README.md that explains how the code and the test can be run

## Running the app
Once you have clonned the app to your local system, you can fire-up the app by opening _iTunesApp.xcworkspace_ file.
Please note that you need to run **pod install** to run application on your machine.

## App Video
https://user-images.githubusercontent.com/1814817/184529621-d53ee15b-33ad-48a7-a0ee-4a4a6cc4667e.mov


## Important Info 
> I'm using few 3rd party pods like 

- pod 'Kingfisher'
- pod 'MBProgressHUD' 
- pod 'Quick'
- pod 'Nimble'

## Running The Tests Manually 

Follow the steps to get test case reports:
* Enable coverage Data under test schema section:
* Select the Test Icon by pressing and holding Xcode Run Icon OR press `Command+Control+U`
* In the Project Navigator under Test Navigator tab, check test status and coverage 


## CodeCoverage Report
<img width="1237" alt="Screenshot 2022-08-14 at 12 56 49 PM" src="https://user-images.githubusercontent.com/1814817/184529778-29f5a68f-00e1-4e28-9808-4cea580071af.png">

# MIT License

Copyright 2022

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

