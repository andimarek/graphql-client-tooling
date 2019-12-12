# Update the schema

Make sure the `../example-server` is running.
Run `./update-schema.sh` 

Sources are generated in `./build/generated/source/apollo/classes/main`

## Manual steps
Install apollo cli: `npm install -g apollo`
Run: `apollo client:download-schema --endpoint=http://localhost:4000/graphql src/main/graphql/com/example/schema.json`
Generate sources: `./gradlew :generateApolloClasses`
