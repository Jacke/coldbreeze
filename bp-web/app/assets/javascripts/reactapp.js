define(function(require){

var React = require('react');
var ReactDOM = require('react-dom');
var Modal = require('react-modal');
var $ = require('jQuery');

/*
By default the modal is anchored to document.body. All of the following overrides are available.

* element
Modal.setAppElement(appElement);

* query selector - uses the first element found if you pass in a class.
Modal.setAppElement('#your-app-element');

*/

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
var appElement = document.getElementById('reactapp')
  function App() {
    this.AppView = React.createClass({
  getInitialState: function() {
    return { modalIsOpen: false };
  },
  openModal: function() {
    this.setState({modalIsOpen: true});
  },
  closeModal: function() {
    this.setState({modalIsOpen: false});
  },
  handleModalCloseRequest: function() {
    // opportunity to validate something and keep the modal open even if it
    // requested to be closed
    this.setState({modalIsOpen: false});
  },
  handleSaveClicked: function(e) {
    alert('Save button was clicked');
  },
  render: function() {
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
            <div className="modal-body">
              <h4>Really long content...</h4>
              <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-default" onClick={this.handleModalCloseRequest}>Close</button>
              /* <button type="button" className="btn btn-primary" onClick={this.handleSaveClicked}>Save changes</button>*/
            </div>
          </div>
        </Modal>
      </div>
    );
  }
});

  }

  App.prototype.init = function () {
    ReactDOM.render(<this.AppView />, document.getElementById('navHelpLink'));
  };

  return App;

});