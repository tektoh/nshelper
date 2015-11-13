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
    return (
      <tr>
        <th>{this.props.resource.type}</th>
        <td>
          <dl className="dl-horizontal">
            {(() => {
              return [
                'ttl', 'name', 'preference', 'exchange', 'address', 'data',
                'mname', 'rname', 'serial', 'refresh', 'retry',  'expire', 'minimum'
              ].map((item) => {
                if (typeof(this.props.resource[item]) != 'undefined') {
                  return (
                    <div>
                      <dt>{this.translate(item)}</dt>
                      <dd>{this.props.resource[item]}</dd>
                    </div>
                  );
                }
              });
            })()}
          </dl>
        </td>
      </tr>
    );
  }
}
