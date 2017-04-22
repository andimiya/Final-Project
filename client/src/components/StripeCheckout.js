import React from 'react'
import StripeCheckout from 'react-stripe-checkout';
import config from '../../config';

class Checkout extends React.Component {
  onToken = (token) => {
    var body = JSON.stringify(token);
    fetch('/charge', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body
    })
    .then((success) => {
      console.log("Success",success)
      if(success){
        this.props.history.push('/homepage')
      }
    })
  }

  render() {
    return (
      <StripeCheckout
        name="Larn Yay"
        description="Saving the Ocean"
        amount={500}
        currency="USD"
        stripeKey="pk_test_a82VbFeXcTfWOcbWyd7H0Wgt"
        locale="en"
        src="http://checkout.stripe.com/v2/checkout.js"
        class="stripe-button"
        alipay
        bitcoin
        token={this.onToken}
        >
      </StripeCheckout>
    )
  }
}

export default Checkout;
