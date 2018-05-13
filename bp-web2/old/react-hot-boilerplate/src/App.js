import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import Modal from 'react-modal';
import ToggleDisplay from 'react-toggle-display';
import Websocket from 'react-websocket';
import NotificationSystem from 'react-notification-system';
import Whoami from './whoami';

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
const imageStyle = {
	content: {
		display:        'inline-block',
		marginRight: '20px',
		float:          'left',
		width:          '40px',
		border:  		'solid 1px gray',
		height:         '40px',
	}
}
class DemoForm extends React.Component {

constructor(props) {
    super(props);
    // Manually bind this method to the component instance...
    //this.handleOptionsButtonClick = this.handleOptionsButtonClick.bind(this);
  	this.handleChange = this.handleChange.bind(this);
  	this.sendDemoRequest = this.sendDemoRequest.bind(this);
  	this.onSubmit = this.onSubmit.bind(this);
  }

static defaultProps = {
    email: '',
  }



  state = {
      email: this.props.email,
  }

  handleChange(event) {
    this.setState({email: event.target.value});
  }
  sendDemoRequest() {
  	console.log(this.state.email)
  }
  onSubmit(e) {
  	e.preventDefault()
  	console.log(this.state.email)
  }
  render() {

	return (
		<div className="personal-demo-container">
			<form className="form-inline" onSubmit={this.onSubmit}>
				<div className="form-group">
					<input type="email" className="form-control" name="email" value={this.state.email} onChange={this.handleChange} />
				</div>
				<button type="button" type="submit" className="btn btn-primary">Request</button>
			</form>
		</div>)
}

}


export default class App2 extends React.Component {

constructor(props) {
    super(props);
    // Manually bind this method to the component instance...
    //this.handleOptionsButtonClick = this.handleOptionsButtonClick.bind(this);
    this.openModal = this.openModal.bind(this);
	this.closeModal = this.closeModal.bind(this);
	this.handleModalCloseRequest = this.handleModalCloseRequest.bind(this);
	this.processPage = this.processPage.bind(this);
	this.workflowPage = this.workflowPage.bind(this);
	this.launchPage = this.launchPage.bind(this);
	this.backPage = this.backPage.bind(this);
  this._notificationSystem = null;

  }

static defaultProps = {
    modalIsOpen: false,
    imageUrl: 'https://facebook.github.io/react/img/logo.svg',
    showPrimary: true,
	showProcess: false,
	showWorkflow: false,
	showLaunch: false,
  }
/**
 * Retrive websocket url that based on current env.
 * @return {String}
 */
  getWsUrl() {
    var baseUrl = window.location.host;
      if (document.ssl_enabled) {
         var ws_type = "wss://";
      } else { var ws_type = "ws://" }
      return ws_type+baseUrl + '/notify'
  }

  state = {
      wsUrl: this.getWsUrl(),
      modalIsOpen: this.props.modalIsOpen,
      imageUrl: this.props.imageUrl,
      showPrimary:  this.props.showPrimary,
      showProcess:  this.props.showProcess,
      showWorkflow: this.props.showWorkflow,
      showLaunch:   this.props.showLaunch,
  }
_addNotification(event) {
  event.preventDefault();
  this._notificationSystem.addNotification({
    message: 'Notification message',
    level: 'success'
  });
}

componentDidMount() {
    this._notificationSystem = this.refs.notificationSystem;
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
  handleData = (data) => {
        this._notificationSystem = this.refs.notificationSystem;

       // do something with the data
       console.log(data);
  this._notificationSystem.addNotification({
    message: data.msg,
    level: 'success'
  });       
       //this.setState({
       //   foo: bar
       //});
  }

  /* 
    Modal pages
  */
  processPage(e) {
  	e.preventDefault();
  	console.log(this.state);
	this.setState({ showProcess: true,
					showWorkflow: false,
					showLaunch: false,
					showPrimary: false, });
  }
  workflowPage(e) {
  	e.preventDefault();
  	console.log(this.state);
	this.setState({ showWorkflow: true,
					showProcess: false,
					showLaunch: false,
					showPrimary: false,
	 });
  }
  launchPage(e) {
  	e.preventDefault();
  	console.log(this.state);
	this.setState({ showLaunch: true,
					showProcess: false,
					showWorkflow: false,
					showPrimary: false,		
	 });
  }
  backPage(e) {
  	e.preventDefault();
  	console.log(this.state);
	this.setState({ showPrimary: true,
					showProcess: false,
					showWorkflow: false,
					showLaunch: false,
	 });
  }


  render() {
return (
      <div>
        <a className="vIcoIn menuEntityLink" onClick={this.openModal}>
            <span className="uicon-svg482">Help</span>        
        </a>
<Websocket url={this.state.wsUrl}
                 onMessage={this.handleData}/>
        <NotificationSystem ref="notificationSystem" />


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
              <h4 className="modal-title">Request a personal demo</h4>
              <DemoForm />
            </div>            
            <ToggleDisplay className="modal-body tutorial-body" show={this.state.showPrimary}>
              <div className="tutorial-step">
                <a href="#" onClick={this.processPage}><h4>Create process</h4></a>
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <a href="#" onClick={this.workflowPage}><h4>Describe workflow</h4></a>
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>   sssui s, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <a href="#" onClick={this.launchPage}><h4>Launch workflow</h4></a>
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>sssui s, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>                            
            </ToggleDisplay>

		   <ToggleDisplay className="step-body" show={this.state.showProcess}>
		          <a onClick={this.backPage} className="back-link">Back</a>
	              <h3>Create process</h3>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>                            
            </ToggleDisplay>

            <ToggleDisplay className="modal-body step-body" show={this.state.showWorkflow}>
              <a href="#" onClick={this.backPage} className="back-link">Back</a>
              <h3>Describe workflow</h3>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>                            
            </ToggleDisplay>
            <ToggleDisplay className="modal-body step-body" show={this.state.showLaunch}>
              <div><a href="#" onClick={this.backPage} className="back-link">Back</a>
              <h3>Launch workflow</h3></div>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>
              <div className="tutorial-step">
                <img className="image" style={imageStyle.content} src={this.state.imageUrl} />
                <p>Nam dsui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
              </div>                            
            </ToggleDisplay>   
       

         
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
/*
export default class App extends Component {
  state = {
      modalIsOpen: false,
      imageUrl: 'https://facebook.github.io/react/img/logo.svg',
  }   	
  render() {
    return (
      <h1>Hesss111llo, worssld.</h1>
    );
  }
}
*/