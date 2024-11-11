const router = require('express').Router();
const Transaction = require('../models/Transaction.js'); 
//get-all-transactions
router.get('/', async (req, res) => {
  try {
    const transactions = await Transaction.find(); 
    res.status(200).json(transactions);
  } catch (error) {
    console.error('Error fetching transactions:', error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
//get-transaction-by-id
router.get('/:id', async (req, res) => {
  try {
    const transaction = await Transaction.findById(req.params.id);
    if (!transaction) return res.status(404).json({ message: 'Transaction not found' });
    res.status(200).json(transaction);
  } catch (error) {
    res.status(500).json({ message: 'Error fetching transaction', error });
  }
});

// UPDATE a transaction by ID
router.put('/:id', async (req, res) => {
  try {
    const { amount, description, tag, date } = req.body;
    const transaction = await Transaction.findByIdAndUpdate(
      req.params.id,
      { amount, description, tag, date },
      { new: true, runValidators: true }
    );
    if (!transaction) return res.status(404).json({ message: 'Transaction not found' });
    res.status(200).json(transaction);
  } catch (error) {
    res.status(500).json({ message: 'Error updating transaction', error });
  }
});

// DELETE a transaction by ID
router.delete('/:id', async (req, res) => {
  try {
    const transaction = await Transaction.findByIdAndDelete(req.params.id);
    if (!transaction) return res.status(404).json({ message: 'Transaction not found' });
    res.status(200).json({ message: 'Transaction deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error deleting transaction', error });
  }
});
//add transaction
app.post('/', async (req, res) => {
  try {
    const { amount, description, tag, date } = req.body;
    const transaction = new Transaction({
      amount,
      description,
      tag,
      date,
    });
    const savedTransaction = await transaction.save();
    res.status(201).json(savedTransaction);
  } catch (error) {
    res.status(500).json({ message: 'Error creating transaction', error });
  }
});



module.exports = router;
