
This is a modified copy of https://github.com/apollographql/frontpage-ios-app 

Make sure you have [CocoaPods installed](https://guides.cocoapods.org/using/getting-started.html) and then run:

```sh
pod install
```
Open the `.xcworkspace` file with xcode and press the run button.

# Updating the schema.json
Make sure the `../example-server` is running.

## Use script
execute `./udpate-schema.sh`

## Manual
Install apollo cli: `npm install -g apollo`
Run: `apollo client:download-schema --endpoint=http://localhost:4000/graphql FrontPage/schema.json`

# Generated code
The generated code is in `FrontPage/API.swift`.


# Run
Run the app from inside xcode with a running server.

