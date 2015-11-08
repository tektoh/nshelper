class QueryResult extends React.Component {
  constructor(props) {
    super(props);
  }

  translate(item) {
    var items = {
      'address': 'アドレス',
      'data': 'データ',
      'name': 'ホスト名',
      'exchange': 'ホスト名',
      'expire': '有効期間',
      'minimum': '最小TTL',
      'mname': 'マスター',
      'preference': '優先度',
      'refresh': 'リフレッシュ',
      'retry': 'リトライ',
      'rname': '管理者',
      'serial': 'バージョン',
      'ttl': 'TTL'
    };
    return items[item];
  }

  render() {
    if (!this.props.data) {
      return <div></div>;
    }

    if (this.props.data.resources && this.props.data.resources.length > 0) {
      var resources = this.props.data.resources.map((resource) => {
        return (
          <tr>
            <th>{resource.type}</th>
            <td>
              <dl className="dl-horizontal">
                {(() => {
                  return [
                    'ttl', 'name', 'preference', 'exchange', 'address', 'data',
                    'mname', 'rname', 'serial', 'refresh', 'retry',  'expire', 'minimum'
                  ].map((item) => {
                    if (typeof(resource[item]) != 'undefined') {
                      return (
                        <div>
                          <dt>{this.translate(item)}</dt>
                          <dd>{resource[item]}</dd>
                        </div>
                      );
                    }
                  });
                })()}
              </dl>
            </td>
          </tr>
        );
      });

      return (
        <div className="panel panel-default">
          <table className="table table-striped table-hover">
            <tbody>
              {resources}
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
