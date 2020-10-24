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
}

const domContainer = document.querySelector('#Agree_button');
ReactDOM.render(e(LikeButton), domContainer);
