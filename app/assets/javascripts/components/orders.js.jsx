var Orders = React.createClass({
  getInitialState: function(){
    return {
      orders: this.props.orders
    }
  },

  render: function(){
    return (
      <table className="table no-margin">
        <thead>
          <tr>
            <th>Order ID</th>
            <th>Servicio</th>
            <th>Status</th>
            <th>Deleviry</th>
          </tr>
        </thead>
        <tbody>
      { this.state.orders.map(function(order){
        return (
          <tr key={ order.id }>
            <td><a href="pages/examples/invoice.html">{order.id}</a></td>
            <td>{order.service}</td>
            <td><span className="label label-warning">{order.status}</span></td>
            <td><div className="sparkbar" data-color="#f39c12" data-height="20"><canvas width="34" height="20" style={{display: 'inline-block', width: '34px', height: '20px'}}></canvas></div></td>
          </tr>
        )
      })}    
        </tbody>
      </table> 
    )
  }
})