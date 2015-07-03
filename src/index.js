require("expose?React!react");
require("expose?Radium!radium");
require("expose?_!underscore");
require("expose?CoffeeTimeActions!./actions/CoffeeTimeActions")

import React from 'react';
import App from './App';

require("./styles/styles.css")

React.render(<App />, document.getElementById('root'));
