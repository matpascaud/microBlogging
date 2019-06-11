# microBlogging

I decided to create the project using Swift as a self training exercise since I have not developed any project using Swift.
The Git commits have not been made in a good way because I thought I would redo all the project but then it you would have been weird to make all the commits in a minute so I decided to keep the way I did.
For the UI, I used the storyboard and created some custom cells for the tableView.
I added a very simple function for cache images and I keep the last content I retrieved for the list of authors.
I decided not to use any third party librairies.

Many things could be improved:
* Use of pagination and limit for all the API calls. I could load more and more objects when scrolling.
* Cache all data
* Use CoreData. I plan to use CoreData at the beginning but it does not really fit with Struct.
* No localization nor for the storyboard, nor for the strings.
* Code need to be documented
* Code for cache retrieved from https://medium.com/@sdrzn/swift-4-codable-lets-make-things-even-easier-c793b6cf29e1. With more time, I would have prefered to put the cache using CoreData  
* handle errors with messages and the different type of errors (timeout, connectivity....)

