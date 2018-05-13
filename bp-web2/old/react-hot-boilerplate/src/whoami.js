import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import Modal from 'react-modal';
import ToggleDisplay from 'react-toggle-display';
import Websocket from 'react-websocket';
import NotificationSystem from 'react-notification-system';


export default class Whoami extends Component {
  static defaultProps = {
    autoPlay: false,
    maxLoops: 10,
  }


  state = {
      modalIsOpen: false,
      imageUrl: 'https://facebook.github.io/react/img/logo.svg',
  }   
  render() {
    return (
      <h1>Hello, worssld.</h1>
    );
  }
}