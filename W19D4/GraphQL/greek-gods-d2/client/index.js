import React from "react";
import ReactDOM from "react-dom";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";
import { InMemoryCache } from "apollo-cache-inmemory";

import App from "./components/App";
import { HashRouter } from "react-router-dom";



// since we know our ids from Mongo will be unique we can use the object.id here
// for mapping our state shape within the InMemoryCache
// now the cache state shape will be {object.id: object}
const cache = new InMemoryCache({
  dataIdFromObject: object => object.id || null
});


const client = new ApolloClient({
  uri: "http://localhost:5000/graphql",
  // using the cache we just created
  cache: cache,
  onError: ({ networkError, graphQLErrors }) => {
    console.log("graphQLErrors", graphQLErrors);
    console.log("networkError", networkError);
  }
});

const Root = () => {
  return (
    // set up the ApolloProvider tag with the Apollo client we set up earlier
    <ApolloProvider client={client}>
      <HashRouter>
        <App />
      </HashRouter>
    </ApolloProvider>
  );
};

ReactDOM.render(<Root />, document.querySelector("#root"));

