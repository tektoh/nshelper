class QueryForm extends React.Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.changeDomain = this.changeDomain.bind(this);
    this.changeRecord = this.changeRecord.bind(this);
    this.changeNSSvr = this.changeNSSvr.bind(this);

    this.state = {
      records: [
        { value: 'ANY', label: 'ANY'},
        { value: 'A', label: 'A'},
        { value: 'AAAA', label: 'AAAA'},
        { value: 'CNAME', label: 'CNAME'},
        { value: 'NS', label: 'NS'},
        { value: 'MX', label: 'MX'},
        { value: 'TXT', label: 'TXT'}
      ],
      nssvrs: [
        { value: '8.8.8.8', label: 'Google Public DNS (8.8.8.8)' },
        { value: '01.dnsv.jp', label: 'お名前.com (*.dnsv.jp)'}
      ],
      domain: '',
      record: 'ANY',
      nssvr: '8.8.8.8'
    }
  }

  changeDomain(e) {
    this.setState({domain: e.target.value });
  }

  changeRecord(e) {
    console.log(e.target.value);
    this.setState({record: e.target.value});
  }

  changeNSSvr(e) {
    this.setState({nssvr: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.onQuerySubmit({
      domain: this.state.domain,
      record: this.state.record,
      ns: this.state.nssvr
    });

    return;
  }

  render() {
    var recordOptions = this.state.records.map((record) => {
      return (
        <option key={record.value} value={record.value}>{record.label}</option>
      );
    });

    var nssvrOptions = this.state.nssvrs.map((nssvr) => {
      return (
        <option key={nssvr.value} value={nssvr.value}>{nssvr.label}</option>
      );
    });

    return(
      <div className="panel panel-default">
        <div className="panel-body">
          <form onSubmit={this.handleSubmit}>
            <div className="form-group">
              <label htmlFor="inputDomain">ドメイン</label>
              <input type="text" id="inputDomain" className="form-control" placeholder="www.example.com" value={this.state.domain} onChange={this.changeDomain} />
            </div>

            <div className="row">
              <div className="col-sm-3">
                <div className="form-group">
                  <label htmlFor="selectRecord">レコード</label>
                  <select id="selectRecord" className="form-control" value={this.state.record} onChange={this.changeRecord}>
                    {recordOptions}
                  </select>
                </div>
              </div>

              <div className="col-sm-9">
                <div className="form-group">
                  <label htmlFor="selectNSServer">NSサーバー</label>
                  <input type="text" list="selectNSServer" className="form-control" value={this.state.nssvr} onChange={this.changeNSSvr} />
                  <datalist id="selectNSServer">
                    {nssvrOptions}
                  </datalist>
                </div>
              </div>
            </div>

            <button type="submit" className="btn btn-primary" disabled={this.props.disabled}>ドメインをチェックする</button>
          </form>
        </div>
      </div>
    );
  }
}
