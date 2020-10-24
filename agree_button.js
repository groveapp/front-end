'use strict';

const e = React.createElement;

class AgreeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { clicked: false };
  }

  render() {
    if (this.state.clicked) {
      return 'Added one to the counter:';
    }

    return e(
      'button',
      { onClick: () => this.setState({ clicked: true }) },
      'Agree with this statement'  
        );
    }
      
 class Counter extends React.Component {
  state = {
    count: 125
  };
  handleClick = () => {
    this.setState((prevState, { count }) => ({
      count: prevState.count + 1
    }));
  };
  render() {
    return <button onClick={this.handleClick}>{this.state.count}</button>;
  }
}

}

const domContainer = document.querySelector('#agree_button_container');
ReactDOM.render(e(AgreeButton), domContainer);
