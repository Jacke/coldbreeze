import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import Modal from 'react-modal';
import jQuery from 'jQuery';

export default class App extends Component {
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

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)'
  }
};

export default class App2 extends React.Component {

  state = {
      modalIsOpen: false,
      imageUrl: 'https://facebook.github.io/react/img/logo.svg',
  }

  openModal() {
    console.log(window.location.href);
    this.setState({modalIsOpen: true});
  }
  closeModal() {
    this.setState({modalIsOpen: false});
  }
  handleModalCloseRequest() {
    // opportunity to validate something and keep the modal open even if it
    // requested to be closed
    this.setState({modalIsOpen: false});
  }
  handleSaveClicked(e) {
    alert('Save button was clicked');
  }

  render() {
return (
      <div>
        <a className="vIcoIn menuEntityLink" onClick={this.openModal}>
            <span className="uicon-svg482">Help</span>        
        </a>
        <Modal
          className="Modal__Bootstrap modal-dialog"
          closeTimeoutMS={150}
          isOpen={this.state.modalIsOpen}
          onRequestClose={this.handleModalCloseRequest}
        >
          <div className="modal-content">
            <div className="modal-header">
              <button type="button" className="close" onClick={this.handleModalCloseRequest}>
                <span aria-hidden="true">&times;</span>
                <span className="sr-only">Close</span>
              </button>
              <h4 className="modal-title">Tutorial</h4>
            </div>
            
            <div className="modal-body tutorial-body">
              <div className="tutorial-step">
                <h4>Ressssally long coffffntent...</h4>
                <img className="image" src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <h4>Really long content...</h4>
                <img className="image" src={this.state.imageUrl} />
                <p>   sssui s, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <h4>Really long content...</h4>
                <img className="image" src={this.state.imageUrl} />
                <p>   sssui s, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>                            
            </div>

            <div className="modal-footer">
              <button type="button" className="btn btn-default" onClick={this.handleModalCloseRequest}>Close</button>
              { <button type="button" className="btn btn-primary" onClick={this.handleSaveClicked}>Save changes</button>}
            </div>
          </div>
        </Modal>
      </div>
    );
  }
}