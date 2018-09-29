import React from 'react';
import { withRouter, Link } from 'react-router-dom';

class SessionForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
      formType: ""
    };
    this.updateInput = this.updateInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    if (this.state.formType != this.props.formType) {
      this.props.clearSessionErrors()
      this.setState({formType: this.props.formType})
    }
  }

  updateInput(e) {
    if (e.currentTarget.id === "username") {
      this.setState({username: e.currentTarget.value})
    } else {
      this.setState({password: e.currentTarget.value})
    }
  }

  handleSubmit(e) {
    const { processForm } = this.props;
    e.preventDefault();
    const user = Object.assign({}, this.state);
    processForm(user);
  }

  render() {
    let {formType, errors} = this.props;
    let formName;
    let otherForm;
    let altLink;
    if (!formType) {
      return null
    }
    if (formType === "signup") {
      formName = <div>Sign Up</div>
      altLink = "/signin"
      otherForm = "Sign In"
    } else if (formType === "signin") {
      formName = <div>Sign In</div>
      altLink = "/signup"
      otherForm = "Sign Up"
    }

    let errors_hash = {};
    for (let i = 0; i < errors.length; i++) {
      errors_hash[errors[i]] = errors[i]
    }
    let password_errors;
    if (errors_hash["Password is too short (minimum is 6 characters)"]) {
      password_errors = "Password is too short (minimum is 6 characters)";
    } else if ((errors_hash["Invalid password/username"])) {
      password_errors = "Invalid password/username";
    }

    let username_errors;
    if (errors_hash["Username can't be blank"]) {
      username_errors = "Username can't be blank";
    } else if ((errors_hash["Username has already been taken"])) {
      username_errors = "Username has already been taken";
    }
    

    return(
      <div className="session-container">
        <div className="session">
          <h3>{formName}</h3>

          <div className={errors_hash["Username can't be blank"] || errors_hash["Invalid password/username"] || errors_hash["Username has already been taken"] ? "sessionForm-input-errors" : "sessionForm-input"}>
            <input id="username" placeholder= "Enter Username" onChange={this.updateInput} value={this.state.username}></input>
              <p className="error-messages">{username_errors}</p>
          </div>

          <div className={errors_hash["Invalid password/username"] || errors_hash["Password is too short (minimum is 6 characters)"] ? "sessionForm-input-errors" : "sessionForm-input"}>
            <input type="password" id="password" placeholder= "Enter Password" onChange={this.updateInput} value={this.state.password}></input>
            <p className="error-messages">{password_errors}</p>
          </div>
          <button onClick={this.handleSubmit}>{formName}</button>
          <Link to={altLink}>{otherForm} instead</Link>
        </div>
      </div>
    )
  }
}

export default withRouter(SessionForm);
