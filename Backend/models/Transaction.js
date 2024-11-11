const mongoose = require('mongoose');

const transactionSchema = new mongoose.Schema({
    amount: {
        type: Number,
        required: true,
      },
      description: {
        type: String,
        required: false,
      },
      tag: {
        type: String,
        required: false,
      },
      date: {
        type: Date,
        required: true,
      },
});

module.exports = mongoose.model('transaction', transactionSchema);