const { ApolloServer, gql } = require('apollo-server');

const typeDefs = gql`
  type Book {
    id: ID!
    title: String!
    author: String
  }

  type Query {
    books: [Book]
  }
  input UpdateBookTitleInput {
      id: ID!
      title: String!
  }
  type UpdateBookTitleResponse {
      message: String
      success: Boolean!
  }
  type Mutation {
      updateBookTitle(input: UpdateBookTitleInput!): UpdateBookTitleResponse
  } 
`;

const books = [
    {
        id: '1',
        title: 'Harry Potter and the Chamber of Secrets',
        author: 'J.K. Rowling',
    },
    {
        id: '2',
        title: 'Jurassic Park',
        author: 'Michael Crichton',
    },
];

const resolvers = {
    Query: {
        books: () => books,
    },
    Mutation: {
        updateBookTitle: (parent, args, context, info) => {
            const { id, title: newTitle } = args.input;
            const bookToUpdate = books.find(book => book.id == id);
            if (bookToUpdate) {
                bookToUpdate.title = newTitle;
                return {
                    success: true,
                    message: "Successfully updated book title"
                };
            } else {
                return {
                    success: false,
                    message: "Book to update not found"
                };
            }
        }
    },
};

// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({ typeDefs, resolvers });

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
    console.log(`🚀  Server ready at ${url}`);
});