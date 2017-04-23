/* jshint esversion:6 */

import React from 'react';

import './Footer.css';

class Footer extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    return(
      <div className="Footer">
      <h1>FOOTER BAR</h1>
      <p> This is only visible on the "/" route
      </p>
      </div>
    )
  }

}

export default Footer;