# Card Trick

Card Trick creates clean and simple flashcards, __automatically__, by scraping comments from a Google Drive file. 

## Installation

Card Trick is built with `ruby '2.6.1'` and `Rails 6.0.0`, so make sure you have both installed. 

To install, fork and clone the [Card Trick repo](https://github.com/jessrezac/card-trick).

Navigate to the `card-trick` directory in Terminal, then execute:

```
$ bundle install
```

This app uses Google Drive API and Google Picker API, so you'll need to set up both. 

Register an app with the Google Picker API using Google's [setup tool](https://console.developers.google.com/start/api?id=picker&credential=client_key). The tool will prompt you through creating a project in the Google API console, enabling the API and creating credentials. Create your application's API key by clicking Create credentials > API key.

You'll also need to retrieve you AppId from the [API Console](https://console.developers.google.com/). Your AppId is the "Project number" on the "IAM & Admin" > "Settings" page, in the developer console.

You will also need to enable the Google Drive API. In the sidebar on the left, expand APIs & auth and select APIs. Click the Drive API link and click Enable API.

Finally, visit the Google API Console to obtain OAuth 2.0 credentials such as a client ID and client secret that are known to both Google and your application.

Card Trick stores API credentials in a file `.env`. Copy the following code and paste into your own `.env` file in the root `card-trick` directory.

```
    GOOGLE_CLIENT_ID=<YOUR_CLIENT_ID> 
    GOOGLE_CLIENT_SECRET=<YOUR_CLIENT_SECRET> 
    GOOGLE_API_KEY=<YOUR_API_KEY> 
    GOOGLE_APP_ID=<YOUR_APP_ID> 
```
Next, in terminal, run:

```
$ rails s
```

Navigate to your rails server and click Login to create an account. 

## Development
After checking out the repo, run `bundle install` to install dependencies. You can also run `rails console` to experiment.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/jessrezac/card-trick. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## References
- [Picker API Developer's Guide](https://developers.google.com/picker/docs)
- [Enable the Google Drive API](https://developers.google.com/identity/protocols/OAuth2)
- [Using OAuth 2.0 to access Google Apis](https://developers.google.com/identity/protocols/OAuth2)
