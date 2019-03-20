mvc design pattern used in the project with Facade Pattern in working with DataLayer


divide the project to DataLayer , View ,Controller 


DataLayer divide to Network ,Parser, Protocol

Network request url  contain all url used by the API and contain apicaller that make all using alamofire method generic not need to write many method to call API and using protocol to make this possible 


helper file contain extension and any thing help us in the project  like activity indicator i do not need to write this code many time 
and 
string extension write the constant of the localization in string extension to make localization more easy 



file call other contain image and localization file and plist , bridge to Objective c because i need library <SDWebImage/UIImageView+WebCache.h> to load image any cach it to prevent load the same image many time 

unit test used in test Network layer 


in view 

main page make the app load data if no internet show us that there are not internet and the user have ability to refresh page . another once and make all tableview cell with stack 

in the details page contain basic data 


pods used in the project 
   pod 'SDWebImage'               to load and caching image 
   pod 'SwiftMessages' .          to make toast message 
   pod 'NVActivityIndicatorView'  to make activity indicator best than default 
   pod 'Localize-Swift' .         used to localiza project and make this project able to used with many language 
   pod 'Alamofire' .              used to call api and check if there are network 
   pod 'SwiftyJSON' .             used to translate json to readable data
   
