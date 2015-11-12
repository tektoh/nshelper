class QueryResults extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    if (!this.props.data) {
      return <div></div>;
    }

    if (this.props.data.resources && this.props.data.resources.length > 0) {
      var results = this.props.data.resources.map((resource) => {
        return (
          <QueryResult resource={resource} />
        );
      });

      return (
        <div className="panel panel-default">
          <table className="table table-striped table-hover">
            <tbody>
              {results}
            </tbody>
          </table>
        </div>
      );
    } else {
      return (
        <div className="panel panel-default">
          <div className="alert alert-danger">Error!</div>
        </div>
      );
    }
  }
}
