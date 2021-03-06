import React, { Component } from 'react';
import MapView from '../../components/MapView';
import Graph from '../../components/Graph';
import { connect } from 'react-redux';
import { addUser } from '../../actions';
import { addUserToState } from '../../actions';
import './App.css';

class App extends Component {

  xhrLoginCheck(){
    return new Promise(function(resolve,reject){
      function reqListener(){
        resolve(this.responseText);
      }
      let oReq = new XMLHttpRequest();
      oReq.open('POST', '/api/users/checkLogin');
      oReq.setRequestHeader('Content-type',
        'application/json')
      oReq.addEventListener("load", reqListener)
      oReq.send()
    })
  }

  componentWillMount(){
    this.xhrLoginCheck()
    .then((userData)=>{
      let user = JSON.parse(userData)
      this.props.onAddUser(user.id, user.firstName, user.lastName, user.email)
    })
    .catch(function(err){
      console.log('User not logged in');
    })
  }


  render() {
    return (
      <div id="home-page-container">
        <div id="map-container">
          <MapView />
        </div>

        <div className="graph-container">
          
          <p className="small-gray-text">Click on the map to view historical data for buoys across our oceans and lakes, or to adopt a shark.<br/><br/> Check back often as tagged sharks will change position on the map and new data will be reported from buoys.
          </p>
          
          <Graph />

        </div>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    users: state.users,
    loggedInUser: state.loggedInUser
  }
}

const mapDispatchToProps = (dispatch) => {
  return{
    onAddUser:(id, firstName, lastName, email) => {
      dispatch(addUserToState(id, firstName, lastName, email));
    },
    getAllUsers:(firstName, lastName, email, password) =>{
      dispatch(addUser(firstName, lastName, email, password));
    }
  }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)(App);
