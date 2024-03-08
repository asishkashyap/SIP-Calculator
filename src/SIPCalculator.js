import React, { Component } from 'react';

class SIPCalculator extends Component {
  constructor(props) {
    super(props);
    this.state = {
      monthlyInvestment: 0,
      years: 0,
      rateOfInterest: 0,
      totalAmount: 0
    };

    this.calculateSIP = this.calculateSIP.bind(this);
  }

  calculateSIP() {
    const { monthlyInvestment, years, rateOfInterest } = this.state;
    const monthlyInterestRate = (rateOfInterest / 100) / 12;
    const totalAmount = (monthlyInvestment * (Math.pow((1 + monthlyInterestRate), (years * 12)))) / (monthlyInterestRate * Math.pow((1 + monthlyInterestRate), (years * 12))) - 1;
    this.setState({ totalAmount });
  }

  render() {
    return (
      <div>
        <h1>Mutual Fund SIP Calculator</h1>
        <form>
          <label htmlFor="monthlyInvestment">Monthly Investment:</label>
          <input type="number" id="monthlyInvestment" value={this.state.monthlyInvestment} onChange={(e) => this.setState({ monthlyInvestment: e.target.value })} />
          <br />
          <label htmlFor="years">Number of Years:</label>
          <input type="number" id="years" value={this.state.years} onChange={(e) => this.setState({ years: e.target.value })} />
          <br />
          <label htmlFor="rateOfInterest">Rate of Interest (%):</label>
          <input type="number" id="rateOfInterest" value={this.state.rateOfInterest} onChange={(e) => this.setState({ rateOfInterest: e.target.value })} />
          <br />
          <button type="button" onClick={this.calculateSIP}>Calculate</button>
        </form>
        {this.state.totalAmount > 0 && (
          <p>Total Amount: {this.state.totalAmount.toFixed(2)}</p>
        )}
      </div>
    );
  }
}

export default SIPCalculator;