export type Maybe<T> = T | null;
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string,
  String: string,
  Boolean: boolean,
  Int: number,
  Float: number,
  /** The `Upload` scalar type represents a file upload. */
  Upload: any,
};


export type Book = {
   __typename?: 'Book',
  id: Scalars['ID'],
  title: Scalars['String'],
  author?: Maybe<Scalars['String']>,
};

export enum CacheControlScope {
  Public = 'PUBLIC',
  Private = 'PRIVATE'
}

export type Mutation = {
   __typename?: 'Mutation',
  updateBookTitle?: Maybe<UpdateBookTitleResponse>,
};


export type MutationUpdateBookTitleArgs = {
  input: UpdateBookTitleInput
};

export type Query = {
   __typename?: 'Query',
  books?: Maybe<Array<Maybe<Book>>>,
};

export type UpdateBookTitleInput = {
  id: Scalars['ID'],
  title: Scalars['String'],
};

export type UpdateBookTitleResponse = {
   __typename?: 'UpdateBookTitleResponse',
  message?: Maybe<Scalars['String']>,
  success: Scalars['Boolean'],
};

