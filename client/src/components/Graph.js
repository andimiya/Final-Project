import React, { Component } from 'react';
import Router from 'react-router';
import { connect } from 'react-redux';
import { LineChart, Line, CartesianGrid, YAxis, XAxis, Tooltip, Legend, Area, AreaChart } from 'recharts';
import { addGraphToState } from '../actions';

class Graph extends Component {
  constructor(props){
    super(props)

    this.state = {
      month: '1',
      year: '2016',
      buoyid: '41002'
    }

    this.buoyChange = this.buoyChange.bind(this);
    this.yearChange = this.yearChange.bind(this);
    this.monthChange = this.monthChange.bind(this);
    this.changeBuoyDataXHR = this.changeBuoyDataXHR.bind(this);
  }

  monthChange(event){
    event.preventDefault()
    new Promise((resolve,reject) => {
      this.setState({
        month: event.target.value
      })
      resolve();
    })
    .then(()=>{
      this.changeBuoyDataXHR()
      .then((data) => {
        this.props.onAddGraphToState(data)
      })
      .catch(function(err){
        console.log("change error", err)
      })
    })
  }

  buoyChange(event){
    event.preventDefault();
    console.log("EVENT", event)
    new Promise((resolve,reject) => {
      this.setState({
        buoyid: event.target.value
      })
      resolve();
    })
    .then(()=>{
      this.changeBuoyDataXHR()
      .then((data) => {
        this.props.onAddGraphToState(data)
      })
      .catch(function(err){
        console.log("change error", err)
      })
    })
  }

  yearChange(event){
    event.preventDefault()
    new Promise((resolve,reject) => {
      this.setState({
        year: event.target.value
      })
      resolve();
    })
    .then(()=>{
      this.changeBuoyDataXHR()
      .then((data) => {
        this.props.onAddGraphToState(data)
      })
      .catch(function(err){
        console.log("change error", err)
      })
    })
  }


  getBuoyData(){
    return new Promise((resolve,reject) => {
      function reqListener(){
        resolve(JSON.parse(this.responseText));
      }
      let oReq = new XMLHttpRequest();
      oReq.open('GET', `/api/buoy/test/${this.state.buoyid}/${this.state.year}/${this.state.month}`);
      oReq.setRequestHeader('Content-type', 
        'application/json')
      oReq.addEventListener("load", reqListener)
      oReq.send()
    })
  }

  changeBuoyDataXHR(value){
    return new Promise((resolve,reject) => {
      function reqListener(){
        resolve(JSON.parse(this.responseText));
      }
      let oReq = new XMLHttpRequest();
      oReq.open('GET', `/api/buoy/test/${this.state.buoyid}/${this.state.year}/${this.state.month}`);
      oReq.setRequestHeader('Content-type', 
        'application/json')
      oReq.addEventListener("load", reqListener)
      oReq.send()
    })
  }

  componentDidMount(){
    this.getBuoyData()
    .then((data) => {
      console.log(data)
      this.props.onAddGraphToState(data)
    })
    .catch(function(err){
      console.log("component did mount on graph error", err)
    })
  }


  render(){
    return(
      <div>
        <form onClick={this.buoyChange}>
          <input type="submit" value="41002"/>
        </form>
        <form onClick={this.buoyChange}>
          <input type="submit" value="41008"/>
        </form>
        <form onClick={this.buoyChange}>
          <input type="submit" value="41004"/>
        </form>
        <h1>This is just for buoy {this.state.buoyid}</h1>
        <div onChange={this.yearChange}>
          <select>
            <option value="2016">2016</option>
            <option value="2015">2015</option>
            <option value="2014">2014</option>
            <option value="2013">2013</option>
            <option value="2012">2012 </option>
          </select>
        </div>
        <div onChange={this.monthChange}>
          <select>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </select>
        </div>


        <AreaChart width={1750} height={250} data={this.props.graphState}
          margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
          <defs>
            <linearGradient id="colorUv" x1="0" y1="0" x2="0" y2="1">
              <stop offset="5%" stopColor="#8884d8" stopOpacity={0.8}/>
              <stop offset="95%" stopColor="#8884d8" stopOpacity={0.5}/>
            </linearGradient>
          </defs>
          <XAxis dataKey="dd" />
          <YAxis />
          <CartesianGrid strokeDasharray="3 3" fill="orange"/>
          <Tooltip />
          <Area type="monotone" dataKey="wvht" stroke="#8884d8" fillOpacity={1} fill="url(#colorUv)" />
        </AreaChart>

      </div>
    )
  }
}

function mapStateToProps(state, ownProps){
  return {
    isLoggedIn: state.loggedIn,
    currentURL: ownProps.location.pathname
  }
}

const mapDispatchToProps = (dispatch) => {
  return{
    onAddGraphToState:(data) => {
      dispatch(addGraphToState(data));
    }
  }
}

const mapStateToProps = (state) => {
  console.log("Graph page state", state)
  return {
    graphState: state.graph,
    loggedInUser: state.loggedInUser
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Graph)