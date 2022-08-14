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


## CodeCoverage Report
<img width="1237" alt="Screenshot 2022-08-14 at 12 56 49 PM" src="https://user-images.githubusercontent.com/1814817/184529778-29f5a68f-00e1-4e28-9808-4cea580071af.png">

