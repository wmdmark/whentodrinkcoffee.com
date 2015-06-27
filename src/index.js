require("expose?React!react");
require("expose?Radium!radium");
require("expose?color!color");
require("expose?makeStyle!./lib/auto-vendor-prefixer");
require("expose?Object.assign!object-assign");
import React from 'react';
import App from './App';

React.render(<App />, document.getElementById('root'));
