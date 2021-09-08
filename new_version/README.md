# Grove Front-end

This is the newest version of the front-end for Grove, written in Flutter.

The code is architected like this:

- **/core** contains the files needed to manage and communicate data. 
    - **/core/models**
        - **/core/data_models** contains definitions of classes that replicate the objects stored in our backend. Each class comes equipped with methods to convert the class to and from JSON.
        - **/core/page_models** contains definitions of data models used only in the front-end, usually for specific pages.
    - **/core/providers** contains providers that can be called to send/retrieve backend data over HTTP for each of the classes defined in /data_models. Each provider will have a method for every potential query requiring that data model (getById, getAll, post, etc.), and these methods return Futures. Each provider also uses api_helper.dart (in /core/services) to make the query.
    - **/core/services** contains helper functions for the API and URL routing. api_helper is currently the only file in use, and it provides the actual HTTP requests (GET and POST for now, and eventually PUT and DELETE) and some basic exception handling, as well as providing some helpful messages for debugging.
    - **/core/mock_data.dart** contains any mock data that might be useful while constructing new UI views.
- **/ui** contains the files for defining the UI and features.
    - **/ui/shared** contains any individual components that might be shared across views/screens. Each file defines classes that are used in the files in /ui/views. colors.dart defines the color scheme, typography.dart defines several text classes that are called whenever text is needed, buttons.dart defines how buttons look, cards.dart defines how various cards work, etc. web_wrapper.dart defines the scaffold for each view, putting together the header, page body, and footer inside a SingleChildScrollView. The page body with is also set to 80% of the available screen width, and this can be tweaked as needed for mobile.
    - **/ui/views** contains the actual screens for our web app. Each file defines the layout for a single screen. 
- **main.dart** is self-explanatory. We use Beamer for convenient URL routing.
- **router.dart** contains the definition of each route inside a BeamerDelegate (which is called by main.dart).
