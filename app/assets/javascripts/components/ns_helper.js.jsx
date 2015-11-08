class NSHelper extends React.Component {
  constructor(props) {
    super(props);

    this.handleQuerySubmit = this.handleQuerySubmit.bind(this);

    this.state = {
      disabled: false,
      data: null
    }
  }

  handleQuerySubmit(data) {
    this.setState({disabled: true});

    $.ajax({
      method: 'GET',
      url: this.props.url,
      dataType: 'json',
      data: data,
      cache: false,
      success: (data) => {
        this.setState({data: data});
      },
      error: (xhr, status, err) => {
        console.error(this.props.url, status, err.toString());
      },
      complete: () => {
        this.setState({disabled: false});
      }
    });
  }

  render() {
    return(
      <div>
        <QueryForm onQuerySubmit={this.handleQuerySubmit} disabled={this.state.disabled} />
        <QueryResult data={this.state.data} />
      </div>
    );
  }
}
