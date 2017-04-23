import React from 'react'
import {Link} from 'react-router-dom'

const Nav = () => {
  return (
    <div className="nav">
    <ul>
        <li><Link to="/">Homepage</Link></li>
        <li><Link to="/login">Login To Account</Link></li>
        <li><Link to="/NewUser">Create an Account</Link></li>
        <li><Link to="/secret">secret route / only if youre logged in</Link></li>
        <li><Link to="/Payment">Adopt a Buoy/Shark With Ca$h Money</Link></li>
        <li><Link to="/Graph">Sample Graph!</Link></li>
    </ul>
    </div>
  )
}

export default Nav;